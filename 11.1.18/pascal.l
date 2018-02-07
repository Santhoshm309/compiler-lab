%{
        #include<stdio.h>
%}
%%
while.*do {
        int i = 0;
        while(yytext[i] != ' ')
        {
                printf("%c",yytext[i]);
                i++;
        }
        printf("(");
        i++;
        while(yytext[i] != ' ')
        {
                printf("%c",yytext[i]);
                i++;
        }
        printf(")");
}
begin {
        printf("(");
}
end {
        printf(")");
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

