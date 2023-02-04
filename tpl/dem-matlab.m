%**********************************************************************
% To prevent crash on using 'surf' : opengl neverselect

clear all; close all;

%======================================================================
% Open files for writing

fin = fopen('testin','w');

fprintf(fin,'# Test input file \n');

for i=1:5
%for i=[1 2 3 4 5]
%for i=1:1:5
  fprintf(fin,'ITEM1|ITEM2|ITEM3|ITEM4| \n');
end

fclose(fin);

%======================================================================

system('grep "^#" -v "testin" > "testtr" ');

%======================================================================
% The trash-file is read line-by-line
% The items on a line are read into a variable

ftr = fopen('testtr','r');

itemsep='|';
nlines=0;

line = fgetl(ftr);
while ischar(line)
  nlines = nlines + 1;
  it = strsplit(line,itemsep);   % This is a cell array
 
  ITM1 = it{1,1};
  ITM2 = it{1,2};
  ITM3 = it{1,3};
  ITM4 = it{1,4};
  
  fprintf('%s | %s | %s | %s | \n',ITM1,ITM2,ITM3,ITM4);

  line = fgetl(ftr);
end;

%======================================================================

fxy = fopen('testxy','w');
x=0:1:360; y=sin(pi*x/180); 
for i=1:361, fprintf(fxy,' %6.2f  %6.2f  \n',x(i), y(i)); end;
fclose(fxy);

%======================================================================

disp('plot of sin(x) and cos(2*x)');

x = 0:(pi/50):2*pi;
y = sin(x);
plot(x,y,'b'); hold on;
y = cos(2*y);
plot(x,y,'r'); grid on;
xlabel('xl'); ylabel('yl'); title('tl');

disp('Print matlab.eps');
print('-depsc2','-r50','test-matlab.eps');
disp('Print matlab.jpg');
print('-djpeg','-r50','test-matlab.jpg');

disp('Matlab is finished');
disp('Press key to quit');
pause

%**********************************************************************
