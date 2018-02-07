%{
        #include<stdio.h>
        #include<string.h>

%}
plus [+]
minus [-]
multi [*]
div [/]
mod [%]
gt [>]
gte >=
lt [<]
lte <=
et [=]
or ||
logical (&&|!)
keywords (int|printf|float|char|double|signed|unsigned|boolean)
loop (if|else|elseif|while|do|switch)
%%
{plus}|{minus}|{multi}|{div}|{mod} { 
                              if(!strcmp(yytext,"+"))
                               printf("\nAddition\t%s",yytext);
                              if(!strcmp(yytext,"*"))
                               printf("\nMultiplication\t%s",yytext);
                              if(!strcmp(yytext,"%"))
                               printf("\nModulo\t%s",yytext);
                              if(!strcmp(yytext,"/"))
                               printf("\nDivision\t%s",yytext);
                              if(!strcmp(yytext,"-"))
                               printf("\nSubtraction\t%s",yytext);  
                             }
{gt}|{gte}|{lt}|{lte}|{et} {
                       printf("\nRelational operator\t%s",yytext);
                           } 
{logical}  {printf("\nLogical operator \t%s",yytext);}    
{keywords} {printf("\nkeyword \t%s",yytext);}
{loop} {printf("\nloop \t%s",yytext);}
[_a-zA-Z]([0-9a-zA-Z])* {printf("\nidentifier \t%s",yytext);}

[^ \t\n]+ "";
%%
int yywrap(void)
{
	return 1;
}
int main() {
	yylex();
	return 0;
}

