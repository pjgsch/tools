#!/bin/sh
################################################################

if   [ "$#" -lt 3 -a "$1" != "-h" ]; then
  echo "====================================================="
  echo " Usage : . grepit.sh <option> <pattern> <filelist> "
  echo "   options :  -h      :  no-filename "
  echo "              -H      :  with-filename "
  echo "              -i      :  ignore case "
  echo "              -v      :  invert-match "
  echo "              -r      :  recursive "
  echo " Usage : . grepit.sh -h for help "
  echo "====================================================="
elif [ "$1" = "-h" ]; then
  echo -n -e "
============================================================
 This script applies 'grep' to search for patterns in a list of files.
 The files must be listed in a text-file with their full 
 path names.
 Spaces in file names are not allowed.
============================================================\n
"
################################################################
else
  option="$1"
  pattern="$2"
  filelist="$3"

  echo "====================================================="
  echo " option   = '$option' "
  echo " pattern  = '$pattern' "
  echo " filelist = '$filelist' "
  echo "====================================================="

######################################################################
#### The contents is copied into the variable 'FILES'.

  files=`cat $filelist`;

#### Each 'line' in $FILES is processed.
#### When the first character is '#' nothing is done.

  for line in $files
  do 
    if [ ${line:0:1} != "#" ]; then      # exclude when 1st char is '#'
      grep $option $pattern $line       # grep
    fi
  done

  echo "====================================================="

fi

######################################################################
