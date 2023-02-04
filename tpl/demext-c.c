/********************************************************************/
/****
/****    Test-program 
/****
/********************************************************************/

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

main()
{
  FILE *f;
  char *line;
  char lines[100];
  char *text[1000];
  char lc,woord[25],wrd[25];
  char linein[100], lineout[100];
  int c,nn,i;
  int length,linenumber;
  int din;
  int numrep;
  long dlo;
  float dfl;
  double ddo;

  lc='l';
  printf("\n");

/**********************************************************************/

  printf("READ a line of text from an input file ===============\n");
  f = fopen("IN.txt","r");
  line = (char *) malloc(100*sizeof(char));
  i = 0;

  while ( (c=getc(f)) != EOF )
  {
    if ( c!='\n' ) line[i++] = c;
/*    if ( c!='\n' ) { *line++ = c; i++; }
*/
//    else { line[i] = '\0'; i = 0; printf("%s\n",line); }
    else
    {
      while (i<=80) line[i++] = 'x';
      line[i] = '\0'; i = 0; printf("%s\n",line);
    }
  }
  fclose(f);
  printf("\n\n\n");

/**********************************************************************/

  printf("READ a number of lines from an input file ===============\n");
  f = fopen("IN.txt","r");
  i = 0; linenumber = 0;
  while ( (c=getc(f)) != EOF )
  {
    if ( c!='\n' ) { lines[i++] = c; }
    else
    { 
      lines[i] = '\0'; i = 0; 
      length = strlen(lines);
      text[linenumber] = (char *) malloc((length+1)*sizeof(char));
      strcpy(text[linenumber],lines); 
      linenumber++; 
    }
  }  
  for (i=0;i<linenumber;i++) printf("%d %s\n",i,text[i]);
  fclose(f);
  printf("\n\n\n");

/**********************************************************************/

  printf("READ a file and print to screen, character by character ==\n");
  f = fopen("IN.txt","r");
  if (f!=NULL)
  {
    c = getc(f); 
    while ( c!=EOF )
    {
      printf("%c",c);
      c = getc(f);
    }
  }
  fclose(f);
  printf("\n\n\n");

/**********************************************************************/

  printf("read a file and print to screen, line by line ===\n");
  f=fopen("IN.txt","r");
  line = (char *) malloc(81*sizeof(char));
  if ( f!=NULL )
  { 
    while ( fgets(line,80,f) != NULL)
    printf("%s",line);
  }
  fclose(f);
  printf("\n\n\n");

/**********************************************************************/

}

/********************************************************************/
