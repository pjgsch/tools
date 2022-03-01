#**********************************************************************
import sys
import os
#======================================================================

infile = open('testin','w')
infile.write("# Test input file \n")
for x in range(0, 5, 1):
  infile.write("ITEM1|ITEM2|ITEM3|ITEM4|\n")
infile.close()

#======================================================================

os.system("grep '^#' -v testin > testtr")

#======================================================================

trfile = open('testtr','r')
for line in trfile:
  items = line.split("|")
  itm1 = items[0]
  itm2 = items[1]
  itm3 = items[2]
  itm4 = items[3]
  print itm1,"|",itm2,"|",itm3,"|",itm4,"|" "\n"
trfile.close()

#======================================================================

trfile = open('testtr','r')
for line in trfile:
  lline = len(line)
  linenew = line[:lline-1]
  print linenew

#======================================================================

print 'sys.platform = %s \n' % sys.platform 

if   sys.platform == 'linux2':
  print 'Computer system is : Linux. \n'
  osys = 'lin'
elif sys.platform == 'win32':
  print 'Computer system is : Windows. \n'
  osys = 'win'
  
if osys=='lin':
  os.system('ls > dir')
elif osys=='win':
  os.system('dir > dir')
else:
  print "OS unknown"

# Open input and output file

filein = open('dir','r')
#fileex = open('','w')
fileex = sys.stdout
f = fileex

for line in filein:
  lenline = len(line)
  newline = line[:lenline-1]
  wordsinline = newline.split(" ")
  f.write(line)
  
if f!=sys.stdout: f.close()

print "============================================================="

#**********************************************************************
