/********************************************************************/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
/*====================================================================*/

int main()
{
  FILE *fin, *ftr;
  char line[100]; 
  char c, chr;
  char item1[100], item2[100], item3[100], item4[100];
  int i, cinl, itemsep, nlines, nitems, nchrs;

/*====================================================================*/

  fin = fopen("testin","w");
  fprintf(fin,"# Test input file \n");
  for (i=0;i<5;i++) 
  { 
    fprintf(fin,"ITEM1|ITEM2|ITEM3|ITEM4| \n"); 
  }
  fclose(fin);

/*====================================================================*/

  system("grep '^#' -v testin > testtr");

/*====================================================================*/
/* The trash-file is read line-by-line */

  ftr = fopen("testtr","r"); //printf("opened ftr \n");
//  line = (char *) malloc(81*sizeof(char));

  itemsep = '|'; 
  nlines = 0;                // line counter

//  if (ftr != NULL )
//  {

  i = 0;

  while ( ( c = getc(ftr) ) != EOF )
  { //1
    if ( c!='\n' ) { line[i++] = c; }
    if ( c=='\n' ) { line[i++] = '\0'; i = 0; }

    if ( i == 0 )    // The 'line' is read and can be processed
    { //2
      //printf("line = [%s] \n",line);
      nlines = nlines + 1;   
      cinl = 0;              // line-character counter
      nitems = 0;            // item counter

      chr = line[cinl]; 

      while ( chr != '\0' )
      { //3
        nitems = nitems + 1;   

        nchrs = 0;           // item-character counter

        while ( chr != itemsep )
        {
          if ( chr != ' ' )  // spaces are ignored
          {
            if (nitems==1) { item1[nchrs] = chr; };
            if (nitems==2) { item2[nchrs] = chr; };
            if (nitems==3) { item3[nchrs] = chr; };
            if (nitems==4) { item4[nchrs] = chr; };
            nchrs = nchrs + 1;
          }
          
          chr = line[++cinl]; 
        }
        chr = line[++cinl]; 
      } //3
      printf("%s | %s | %s | %s | \n",item1,item2,item3,item4);
      //printf("nitems = %d \n",nitems);
      //printf("nlines = %d \n",nlines);
    } //2
  } //1
//}
  fclose(ftr);

}
/********************************************************************/
