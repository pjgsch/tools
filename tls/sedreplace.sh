#!/bin/sh
################################################################

################################################################
if [ "$#" -lt 1 ]; then
  echo -n -e "
============================================================
 Usage : . sedreplace.sh <filelist> <pattern> <mode>
         . sedreplace.sh -h 
============================================================\n
"
elif [ "$1" = "-h" -o "$1" = "--help" ]; then
  echo -n -e "
============================================================
 The script replaces (a) text-pattern(s) in a list of files.
 The files must be in a text file with their full path names.
 Spaces in file names are not allowed.

 If the third argument is rejected, the pattern must be provided
 as the second argument, formated according to the rules of 'sed'.
 If the third argument is -f (or --file), multiple patterns in
 a pattern file will be processed.
 The pattern file name is provided as the second argument.
============================================================\n
"
################################################################
else

filelist="$1"
mode="$3"
pattern="$2"

#echo $filelist
#echo $pattern
################################################################

WORKDIR=`pwd`
cd $WORKDIR

################################################################
#### Files must be listed with full path names in 'filelist'.
#### The contents is copied into the variable 'files'.

files=`cat $filelist`;

#### Each 'line' in $files is processed.
#### When the first character is '#' nothing is done.
#### Otherwise, the 'path name' and 'file name' are isolated.
#### The file is backuped and subsequently processed with 'sed'.
#### The pattern is in a separate file 'rplpat'.
#### The processed file is moved to the initial location.

for file in $files
do
  if [ ${file:0:1} != "#" ]; then
    pathname=${file%/*}
    filename=${file##*/}
    /bin/cp $file $WORKDIR/$filename.bak

    if [ "$mode" = "-f" -o "$mode" = "--file" ]; then
      sed -f $pattern $WORKDIR/$filename.bak > $WORKDIR/$filename.new
    else
      sed $pattern $WORKDIR/$filename.bak > $WORKDIR/$filename.new
    fi

#    /bin/mv $WORKDIR/$filename.new $file
  fi
done

fi

################################################################
