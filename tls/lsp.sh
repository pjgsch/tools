#!/bin/bash
################################################################
# ls -1  : list files in one column
# ls -a1 : list files in one column, including hidden files
# pwd    : working directory
# sed s(=replace)<separator>target<separator>new<separator>g(=global)

################################################################
if [ "$#" -lt 1 ]; then
  echo -n -e "
============================================================
 Usage : . lsp.sh <option>
         . lsp.sh --help => help
============================================================\n
"
elif [ "$1" = "--help" ]; then
  echo -n -e "
============================================================
 With this script we can make a listing of files in 
 a directory.
 The options are :
 none        : full path names; no hidden files
 -h          : full path names; with hidden files
 -H          : skip \$HOME; no hidden files
 -Hh or -hH  : skip \$HOME; with hidden files
 -d          : only current directory; no hidden files
 -dh or -hd  : only curren directory; with hidden files
 -c          : full path names; with hidden files; with quotes
============================================================\n
"
################################################################
else

ARG="$1"

BASEDIR="$HOME"

if   [ "$ARG" = "-h" ]; then  
  # all with path
  ls -a1 | sed s?^?`pwd`/?g 
elif [ "$ARG" = "-H" ]; then  
  # with path from $HOME
  ls -1 | sed s?^?`pwd`/?g | sed s?$BASEDIR/??g 
elif [ "$ARG" = "-Hh" -o "$ARG" = "-hH" ]; then  
  # all with path from $HOME
  ls -a1 | sed s?^?`pwd`/?g | sed s?$BASEDIR/??g 
elif [ "$ARG" = "-d" ]; then  
  # with current directory
  D=`pwd` && ls -1 | sed s?^?${D##*/}/?g
elif [ "$ARG" = "-dh" -o "$ARG" = "-hd" ]; then  
  # all with current directory
  D=`pwd` && ls -a1 | sed s?^?${D##*/}/?g
elif [ "$ARG" = "-c" ]; then  
  # with ''
  ls -a1 | sed s?^?`pwd`/?g | sed s?^?\"?g | sed s?\$?\"?g
else
  # with path
  ls -1 | sed s?^?`pwd`/?g  
fi

fi

################################################################
