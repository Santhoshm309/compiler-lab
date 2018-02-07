%{
#include<stdio.h>
#include<string.h>
        char buf[20];
%}
b1 [{]
b2 [}]
num [0123456789]
p [+]
pp [+]
rel (<=|>=|==|!=|<|>)
infi ;;
f for
i [i]
o [)]
ini i=0
%%
{infi}               printf("\nINFINITE FOR here: for(;;)",yytext);
{f}                  printf("NESTED FOR");
{ini}                printf("\n{ %s",yytext);
i{rel}{num}*         printf("\nI:if(%s)",yytext);
i{p}{pp}             strcpy(buf,yytext);
{b1}.                printf("\t%s;",yytext);
{b2}                 printf("%s",buf); printf("\nGOTO I }");
;                    printf(";");
{o}                  printf("");

%%
int yywrap(void) {
        return 1;
}
int main(int argc, char *argv[]) {
        yyin=fopen("input.txt","r");
        yylex();
        fclose(yyin);
}

