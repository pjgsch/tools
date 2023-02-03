#!/usr/bin/perl -w
#**********************************************************************
use POSIX;
#======================================================================

$infile = "testin";
$exfile = "testex";
$trfile = "testtr";

#======================================================================

open(OUT,">$infile");
print OUT "# Test input file \n";
for ($i=0;$i<5;$i++)
{
  print OUT "ITEM1|ITEM2|ITEM3|ITEM4|\n";
}
close(OUT);

#======================================================================

system('grep "^#" -v testin > testtr');

#======================================================================

$itemsep = "|";
$nlines = 0;

open(IN,"$trfile"); @lines = <IN>; close(IN);

foreach $line (@lines) 
{  
  chomp($line);
  @items = split('\|',$line);
  $ITM1 = $items[0];
  $ITM2 = $items[1];
  $ITM3 = $items[2];
  $ITM4 = $items[3];
  print "$ITM1 | $ITM2 | $ITM3 | $ITM4 | \n"
}

#======================================================================

open(OUT,">testxy");

$pi = 4*atan(1);

for ($i=0;$i<360;$i++)
{
  $x = $i;
  $y = sin(($x/180)*$pi);
  printf OUT "%5.2f   %5.2f \n" ,$x, $y ;
#  print OUT "$x    $y \n";
}
close(OUT);

#**********************************************************************
