%{
#include<stdio.h>
#include<string.h>
int i,j,k;
char expr[10][10];
char temp[10];
char condition[10];
int isloop;
int indes;
%}
%%
(if)\(.*("&&").*\) {
                        // printf("%d\n",yyleng);

                        j=0;
                        k=0;
                        isloop=1;
                        int t = 4;
                        i=3;
                        while(i<yyleng){
                        printf("%d\n\n",indes);
                        for(i;yytext[i]!='&' && i< yyleng;i++)
                        {
                        temp[j]=yytext[i];
                        j++;
                        }
                        i = i+2;
                        j=0;
                        strcpy(expr[indes++],temp);

                        }
                        while(k<indes-1){
                                printf("if(%s){\n",expr[k]);
                                k++;
                        }
                        printf("if(%s)\n",expr[k]);
}


\} {
        while(indes--)
        {
                printf("\n}");
                k++;
        }
}
. ECHO;
%%
int yywrap()
{
 return 1;
}
int main()
{
        yylex();
        return 0;
}

