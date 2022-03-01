**********************************************************************

      program main

      implicit none
      integer i
      integer nlines, nitems
      integer lenline, lenitm1, lenitm2, lenitm3, lenitm4
      character itemsep, char
      character line*256, itm1*30, itm2*30, itm3*30, itm4*30
      real pi, x, y

c=====================================================================
      
      open (unit=1, file='testin')
      write (1,*) '# Test input file'
      do 10 i=1,5
        write (1,*) 'ITEM1|ITEM2|ITEM3|ITEM4|'
 10   continue
      close (unit=1)

c=====================================================================
c     Each line written to 'testin' starts with a space !?

      call system("grep '^ #' -v testin > testtr")

c=====================================================================

      open (unit=2, file='testtr')

      itemsep = '|'
      nlines = 0;

 20   read (2,*,end=100) line

      lenline = 256
 30   if (line(lenline:lenline) .eq. ' ') then
        lenline = lenline - 1
        goto 30
      endif                  

c     The 'line' is read and can be processed

      nlines = nlines + 1

      lenitm1 = 0
      lenitm2 = 0
      lenitm3 = 0
      lenitm4 = 0
      nitems = 1

      do 40 i = 1,lenline
      char = line(i:i)
      if (char .ne. itemsep) then
        if (nitems .eq. 1) then
          lenitm1 = lenitm1 + 1
          itm1(lenitm1:lenitm1) = char
        elseif (nitems .eq. 2) then
          lenitm2 = lenitm2 + 1
          itm2(lenitm2:lenitm2) = char
        elseif (nitems .eq. 3) then
          lenitm3 = lenitm3 + 1
          itm3(lenitm3:lenitm3) = char
        elseif (nitems .eq. 4) then
          lenitm4 = lenitm4 + 1
          itm4(lenitm4:lenitm4) = char
        endif
      else
        nitems = nitems + 1
      endif
        
 40   continue

      write (*,*) (itm1(i:i),i=1,lenitm1),'|',
     &            (itm2(i:i),i=1,lenitm2),'|',
     &            (itm3(i:i),i=1,lenitm3),'|',
     &            (itm4(i:i),i=1,lenitm4),'|'
      goto 20
 100  continue

      close (unit=2)

**********************************************************************
c     calculate a sine function and write values to file

      open (unit=1, file = "testxy")

      pi = 4*atan(1.0)

      write (*,*), pi  
    
      do 50 i=1,361
        x = i-1
        y = sin(x/180*pi)
        write (1,'(1X,F10.4,3X,F10.4)'), x, y
 50   continue

      close (unit=1)

**********************************************************************
      end

**********************************************************************
