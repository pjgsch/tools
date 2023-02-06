#! /bin/sh
################################################################

################################################################
if [ "$#" -lt 1 ]; then
  echo -n -e "
============================================================
 Usage : . tarittt.sh <tarfile> <filelist> 
         . tarittt.sh -h 
============================================================\n
"
elif [ "$1" = "-h" -o "$1" = "--help" ]; then
  echo -n -e "
============================================================
 This script makes a tar-ball <tarfile> from files in the 
 textfile <filelist>.
 Full path names must be provided.
 Only file names will be included in the tar-file.
============================================================\n
"
################################################################
else

#cd $WORKDIR

tarfile=$1
filelist=$2

tmpfile="tmpfile"
errfile="errfile"
tarscript="tarsh.sh"

grep '^#' -v $filelist > $tmpfile

echo "These files could not be found: " > $errfile
echo "#! /bin/sh" > $tarscript
echo "tar -cvf $tarfile \\" >> $tarscript

while read line
do
  if [ -e $line ]; then
    pathname=${line%/*}
    filename=${line##*/}
    echo "-C ${pathname}/   ${filename} \\" >> $tarscript
  else
    echo "$line" >> $errfile
  fi
done < "$tmpfile"

sh $tarscript

rm -f $tmpfile $tarscript
#echo "=============================================="
#echo "tar-script       $WORKDIR/$tarscript "
#echo "tar-file         $WORKDIR/$tarfile "
echo "=============================================="
more $errfile
echo "=============================================="
rm -f $errfile

fi

################################################################
