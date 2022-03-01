**********************************************************************

      PROGRAM IODEM

      IMPLICIT  NONE
      INTEGER   I,J,LINLEN,NLN
      INTEGER   nwrd,nwch,wlen
      INTEGER   SEL
      INTEGER   int1
      REAL*8    flt1,exp1
      CHARACTER LINE*256, CHRARR(256)*1, STRARR(10)*10, TEXT(100)*256
      CHARACTER CHAR, WRD(1000)*20

**********************************************************************

      OPEN (UNIT=1, FILE='IN1.txt')
      OPEN (UNIT=2, FILE='IN2.txt')
      print *, 'Select printmode (see f-file) '
      read  *, sel

**********************************************************************

      if (sel .ge. 1 .and. sel .le. 10) then

 10   READ (1, '(A256)', END=15) LINE
      READ (2, '(256A)', END=15) (CHRARR(I), I=1,256)

      I = 256
 20   IF (LINE(I:I) .EQ. ' ') THEN
        I = I - 1
        GOTO 20
      ENDIF
      LINLEN = I

      if (sel .eq. 1) PRINT *       , LINE
      if (sel .eq. 2) PRINT '(A)'   , LINE
      if (sel .eq. 3) PRINT '(A256)', LINE
      if (sel .eq. 4) PRINT '(256A)', (LINE(I:I)   , I=1,LINLEN)
      if (sel .eq. 5) PRINT '(256A)', (LINE(I:I)   , I=1,256)
      if (sel .eq. 6) WRITE (*, '(256A)') (LINE(I:I)   , I=1,256)
      if (sel .eq. 7) WRITE (*, *)        LINE
      if (sel .eq. 8) PRINT '(256A)', (CHRARR(I)   , I=1,256)
       
      GOTO 10

 15   CONTINUE

      endif

**********************************************************************

      if (sel .ge. 11 .and. sel .le. 20) then

      J = 1
 30   READ(1, '(A256)', END=35) TEXT(J)
      J = J + 1
      GOTO 30
      
 35   CONTINUE

      NLN = J - 1

      if (sel .eq. 11) PRINT '(A256)'     , (TEXT(I), I=1,NLN)
      if (sel .eq. 12) WRITE (*,'(A256)')   (TEXT(I), I=1,NLN)
      
      print '(''DE TEKST BEVAT'', I5 , ''  REGELS.'')', nln

      endif

**********************************************************************

      if (sel .ge. 21 .and. sel .le. 30) then

      nwrd = 0 
      nwch = 0

 41   read(1,'(A256)',end=45) line

      do 42 i = 1,256

      char = line(i:i)

      if (char .eq. ' ' .or. 
     &    char .eq. '.' .or. 
     &    char .eq. ',') 
     &then
         nwch = 0
      else
         if (nwch .eq. 0) nwrd = nwrd + 1
         nwch = nwch + 1
         wrd(nwrd)(nwch:nwch) = char
      endif

 42   continue

      goto 41

 45   continue

      if (sel .eq. 21) then

      do 60 i = 1,nwrd
      print *, wrd(i)
 60   continue

      else if (sel .eq. 22) then

      do 70 i = 1,nwrd
         wlen = len(wrd(i))
         print '(i5,3x,20a)', wlen, (wrd(i)(j:j), j=wlen,1,-1)
 70   continue

      endif

      print '(''DE TEKST BEVAT'', I5 , ''  WOORDEN.'')', nwrd
   
      endif

**********************************************************************

      if (sel .eq. 100) then

      int1 = 10
      flt1 = 12.34
      exp1 = 1.23e4

      write (*,*) int1, flt1, exp1
      write (*, '(I3,2X,F6.3,2X,E10.3,2X)') int1, flt1, exp1
      write (*, '(''print : '', 2X,I3,2X)') int1
      write (*, '(A,2X,I3,2X)') 'print : ', int1
      write (*, '(A10,2X,I3,2X)') 'print : ', int1
 
      endif

**********************************************************************

  
      CLOSE (UNIT=1)
      CLOSE (UNIT=2)
      
      END
