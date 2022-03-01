#!/bin/sh
#======================================================================

#### Input can be tested
#if [ "$#" -lt 1 ]; then 
#  echo "Give one argument"
#  return 1; 
#fi

#### Ask for input : -s means 'silent'
#echo "Give name = word of 4 letters"
#read -sp 'Give name   : ' name
#if [ "${#name}" -lt 4 ]; then return 1; fi
#name=""

# The read command expects input which is given to variable 'name'.
# It waits 10 seconds for input to be given.
#read -t 10 name ;
#[ ! -z "$name" ] && echo $name || echo "wait time exceeded"


path=`pwd`
infile="$path/testin";
infilename="${infile##*/}"
infilepath="${infile%/*}/"

exfile="testex";
trfile="testtr";

#======================================================================

alias begincomment="if [ ]; then"
alias endcomment="fi"

begincomment
 This is comment: line 1
 This is comment: line 2
endcomment

#======================================================================
#### Write to a file

printf "# Test input file \n" > $infilename

for i in {1..5}
#for i in 1 2 3 4 5
#for i in (1..5..1}
do
  printf "ITEM1|ITEM2|ITEM3|ITEM4| \n" >> $infilename
done

#======================================================================

grep '^#' -v $infilename > $trfile

#======================================================================
# The trash-file is read line-by-line
# The items on a line are read into a variable

itemsep="|"
nlines=0;

# The input file is read line-by-line.
# IFS='' prevents trimming of leading/trailing whitespaces.
# -r prevents backslash escapes from being interpreted.
# [[ -n .... ]] does something which I forgot.

#while IFS='' read -r line || [[ -n "$line" ]]; do
while read line
do
  if [ ${#line} -gt 0 ] 
  then
    if [ "${line:$((${#line}-1)):1}" != "$itemsep" ]  
    then
      line=$line$itemsep;
    fi

    nlines=$(( nlines + 1 ));
    rest="$line";
    itemnr=0;

    while [ "${#rest}" -gt 0 ]
    do
      itemnr=$(( itemnr + 1 ));
      item="${rest%%${itemsep}*}";

      if [ $itemnr = 1 ];  then ITM1=$item; fi
      if [ $itemnr = 2 ];  then ITM2=$item; fi
      if [ $itemnr = 3 ];  then ITM3=$item; fi
      if [ $itemnr = 4 ];  then ITM4=$item; fi

      rest="${rest#*${itemsep}}"
    done

    ITM1=`echo $ITM1`     # removes leading and trailing spaces

    echo "$ITM1 | $ITM2 | $ITM3 | $ITM4 | "
   
    printf '%s' "$ITM1 | $ITM2 | $ITM3 | $ITM4 | " >> $exfile

  fi

    printf "\n" >> $exfile  
  
done < "$trfile"

#======================================================================
# Calculation with 'bc';  -l indicates the use of math functions

pi=`bc -l <<< "4*a(1)"`
touch "testxy"
for i in {0..360}
do
  x=$i
  y=`bc -l <<< "s(($x/180)*$pi)"`
  printf "%f  %f \n" "$x" "$y" >> "testxy"
done

#**********************************************************************

