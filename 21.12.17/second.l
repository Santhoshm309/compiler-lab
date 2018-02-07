%{
        #include<stdio.h>
        extern FILE *yyin,*yyout;
%}
datatypes (int|float|char|double)
whitespace [ \t\n\r]+
identifier [_a-zA-Z]([_a-zA-Z0-9])*
value [0-9]+
%%
{datatypes}{whitespace}{identifier} {
        fprintf(yyout,"%s;\n",yytext);
}
("printf").* ;
[\n] "";
for\( "";
. ;
%%
int yywrap()
{
        return 1;
}
int main()
{
        yyin = fopen("input.cpp","r");
        yyout = fopen("output.txt","a");
        yylex();
        return 0;
}

