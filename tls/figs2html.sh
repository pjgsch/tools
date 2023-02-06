#!/bin/sh
################################################################

################################################################
if [ "$#" -lt 1 ]; then
  echo -n -e "
============================================================
 Usage : . figs2html.sh <filelist> 
         . figs2html.sh -h 
============================================================\n
"
elif [ "$1" = "-h" -o "$1" = "--help" ]; then
  echo -n -e "
============================================================
 This script can be used to put figures in an html-page.
 The figures must be listed in a text-file with their full 
 path names.
============================================================\n
"
################################################################
else

  cd `pwd`

  figlist="$1"

  figlistsel="figlistsel.txt"  ; rm -f $figlistsel

  grep '^#' -v $figlist > $figlistsel

  fightml="fightml.html" ;  rm -f $fightml
  
  nfigures=0

  echo "<HTML><BODY>" > $fightml
  cat "$figlist" |
  while read line
  do
    nfigures=$(( nfigures + 1 ))
    echo "$nfigures "
#    echo "<TABLE class=\"image\">" >> $fightml
    echo "<TABLE>" >> $fightml
    echo "<TR>" >> $fightml
    echo "<TD><IMG src=\"$line\" width=\"300\" alt=\"$line\"> </TD>" >> $fightml
    echo "</TR>" >> $fightml
    echo "<TR><TD class=\"caption\"><FONT size=-10>$line</FONT> </TD>" >> $fightml
    echo "</TR>" >> $fightml
    echo "</TABLE>" >> $fightml
  done
  echo "</HTML></BODY>" >> $fightml

  echo "============================================================"
  echo " fightml = $fightml"
  echo "============================================================"

fi

################################################################
