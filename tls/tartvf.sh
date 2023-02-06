#!/bin/sh
################################################################
####
#### Make a list of tar-files with
####  ls -1 <tar-file-names> > tarlst
#### Then print the contents
####  . tartvf.sh tarlst
####

################################################################
if [ "$#" -lt 1 ]; then
  echo -n -e "
============================================================
 Usage : . tartvf.sh <filelist> 
         . tartvf.sh -h 
============================================================\n
"
elif [ "$1" = "-h" -o "$1" = "--help" ]; then
  echo -n -e "
============================================================
 This script prints the contents of tar-files, which are 
 listed in the text-file <filelist>.
============================================================\n
"
################################################################
else

#cd $WORKDIR

filelist="$1"

scfile="tmpfile"

grep '^#' -v $filelist > $scfile

printf "\n**********************************************************\n"

while read line
do 

  if [ ${#line} -gt 0 ]     # discard empty line
  then

    printf "\n$line \n"
    tar tvf $line

  fi

done < "$scfile"

printf "\n**********************************************************\n"

fi

################################################################
