#!/usr/bin/perl -w

#**********************************************************************
# The package POSIX is used to get numbers from text strings.

#print @INC,"\n";
use POSIX;
#use pln;

# use POSIX qw(setsid);
# use POSIX qw(:errno_h :fcntl_h);

#======================================================================
# First we print some text to a file.

#pln();

open(OUT,">txt.txt");

print OUT <<stoppp;
Dit is een stukje tekst dat gebruikt wordt om het 
opsplitsen van tekst in regels en woorden te testen.
De tekst wordt ingelezen en eerste opgedeeld in regels.
Daarna worden de regels opgedeeld in woorden.
Vervolgens worden de woorden opgedeeld in karakters.
stoppp

close(OUT);

#**********************************************************************
# Printing things from a text file to standard output.

open(IN,"txt.txt");
@lines = <IN>;
close(IN);

print "============================================================\n";
print "  The complete text is printed\n";
print "============================================================\n";

print @lines;

print "============================================================\n";
print "  The first line is printed\n";
print "============================================================\n";

$line  = $lines[0];
print $line;

print "============================================================\n";
print "  All lines are printed separately\n";
print "============================================================\n";

foreach $line (@lines) {
  print $line;
}

print "============================================================\n";
print "  All words of the first line are printed (twice)\n";
print "============================================================\n";

# A string can be split in parts, which can be stored in an array.
# The separator can be defined.
# The function which does the job is 'split'.
# The array elements can be printed with a separator defined in $".

@words = split(" ",$line);
print @words,"\n";
print "@words\n";           # the same again


print "============================================================\n";
print "  The first word of the first line is printed\n";
print "============================================================\n";

$word  = $words[0];
print $word,"\n";

print "============================================================\n";
print "  All words of the first line are printed separately\n";
print "============================================================\n";

foreach $word (@words) {
  print $word;
}
print "\n";

print "============================================================\n";
print "  All characters of the first word are printed\n";
print "============================================================\n";

@chars = split("",$word);
print @chars,"\n";

print "============================================================\n";
print "  The first character of the first word is printed\n";
print "============================================================\n";

$char  = $chars[0];
print $char,"\n";

print "============================================================\n";
print "  All characters of the first word are printed separately\n";
print "============================================================\n";

foreach $char (@chars) {
  print $char;
}
print "\n";

print "============================================================\n";
print "  The text is printed characterwise\n";
print "============================================================\n";

foreach $line (@lines) {
  @words = split(" ",$line);
  foreach $word (@words) {
    @chars = split("",$word);
    foreach $char (@chars) {
    print $char;
    }
    print " ";
  }
  print "\n";
}

print "============================================================\n";
print "  A two-dimensional array with all characters is made and printed\n";
print "============================================================\n";

# The lines are read characterwise into a two-dimensional array.
# txt = array with text
# l   = line counter
# c   = character counter

$l=0;
foreach $line (@lines)
{
  $len = length($line);
  for ($c=0;$c<=$len;$c++) {
    $char = substr($line,$c,1.0);
    $txt[$l][$c] = $char;
  }
  $l++;
}

# The lines are written to the screen characterwise.
# nl = number of lines
# nc = number of characters in a line

$nl = $#txt;
for $l (0 .. $nl) {
  $nc = $#{$txt[$l]};
  for $c (0 .. $nc) {
    print $txt[$l][$c];
  }
}

print "============================================================\n";
print "  The system command 'ls -aF /etc' is given \n";
print "  Its output is processed : list entries starting with 'f' \n";
print "  File 'fstab' is listed \n";
print "============================================================\n";

$etc = `ls -aF /etc`;

@fetc = split(" ",$etc);

foreach $itm (@fetc) {
  @itms = split("",$itm);
  if ($itms[-1] eq "/" and $itms[0] eq "f") {print @itms,"\n"}
  if ($itm eq "fstab") {print `more /etc/fstab`}
}

print "============================================================\n";
print "  Get integer numbers from text strings  \n";
print "============================================================\n";

# The text strings are defined containing integer numbers.
# Also the base (10) is given.
# The parsing is done with the function 'strtol'.

$str1='33423';
$str2='56357';

$base=10;

$! = 0;
($num1, $n_unparsed) = POSIX::strtol($str1, $base);  
($num2, $n_unparsed) = POSIX::strtol($str2, $base);  

$num3 = $num1 + $num2;

print "$num1 $num2 $num3 \n";

print "============================================================\n";
print "  Get real numbers from text strings  \n";
print "============================================================\n";

$str1='123.456e2';
$str2='45.567';

$! = 0;
$num1 = POSIX::strtod($str1);  
$num2 = POSIX::strtod($str2);  

$num3 = $num1 + $num2;

print "$num1 $num2 $num3 \n";

print "============================================================\n";
print "  Finished  \n";
print "============================================================\n";

`rm -i txt.txt`;

#**********************************************************************

