%{
#include<stdio.h>
#include<string.h>
extern FILE *yyin;
extern FILE *yyout;
int i=0;
%}
datatypes (int|float|char|void)
whitespace [ \t\n\r]+
identifier [a-zA-Z]+
arguments [a-zA-Z]*
%%
{datatypes}{whitespace}{identifier}\(.*\) { printf("%s",yytext);
                                           fprintf(yyout,"#define ");
                                           while(yytext[i]!=' ')
                                           i++;
                                           while(i++<yyleng)
					  fprintf(yyout,"%c",yytext[i]);
					
					
}
[ \n\t]* ;
\{ ;
\} ;
[(return)].* ECHO;
; ;
. ;
%%
int yywrap(void)
{
return 1;
}
int main()
{
yyin=fopen("input.c","r");
yyout=fopen("output.c","w");
yylex();
return 0;
}
