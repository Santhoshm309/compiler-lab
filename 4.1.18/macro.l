%{
#include "stdio.h"
int yyval;
int i;
%}
%%

#define.*(.*).*  {
                   printf("matched macro is:\n %s \n",yytext);
                   printf("\n converted func is :\nint");
                   for(i=8;yytext[i]!='(';i++)
                   {
                   printf("%c",yytext[i]);
                   }

                   printf("%cint ",yytext[i]);
                   i++;
                   while(yytext[i]!=')')
                   {
                  printf("%c",yytext[i]);
                  i++;
                  if(yytext[i]==',')
                  {
                 printf(",int ");
                  i++;
                 }
                  }
                printf("%c \n{\n\t return ",yytext[i]);
                i=i+2;

                while(i<yyleng)
                {
                printf("%c",yytext[i]);
                i++;
                }
                printf(";\n}\n");
                }
. {}
\n {}
%%
yywrap()
{
return 1 ;
}
main()
{
yylex();
return 0;
}

