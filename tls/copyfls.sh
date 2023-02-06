#! /bash
################################################################

################################################################
if [ "$#" -lt 1 ]; then
  echo -n -e "
============================================================
 Usage : . copyfls.sh <filelist> 
         . copyfls.sh -h 
============================================================\n
"
elif [ "$1" = "-h" -o "$1" = "--help" ]; then
  echo -n -e "
============================================================
 This script can be used to copy files.
 The files must be listed in a text-file with their full 
 path names.
============================================================\n
"
################################################################
else

cd `pwd`

filelist=$1

if [ ! -f $filelist ]; then
  echo "=============================================="
  echo "File ('filelist') not found in this directory"
  echo "=============================================="
else

tmpfile="tmpfile"
errfile="errfile"
filedir="filedir"

/bin/rm -rf $filedir
mkdir $filedir

grep '^#' -v $filelist > $tmpfile

echo "These files could not be found: " > $errfile

while read line
do
  if [ -e $line ]; then
    pathname=${line%/*}
    filename=${line##*/}
    /bin/cp $line $filedir/.
  else
    echo "$line" >> $errfile
  fi
done < "$tmpfile"

echo "=============================================="
more $errfile
echo "=============================================="
echo "Files are in 'filedir'"
echo "=============================================="
fi

/bin/rm $tmpfile
/bin/rm $errfile

fi

################################################################
