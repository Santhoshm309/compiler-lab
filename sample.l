%{
    int num_newlines=0;
%}
digit [0-9]
letter [a-zA-Z]
%%
{letter}({letter}|{digit})* printf("id: %s\n", yytext);
\n                          {
                             printf("new line\n");
                             num_newlines++;
                            }
%%
int yywrap(void)
{
return 1;
}
int main() {
       yylex();
       printf("Number of lines = %d\n", num_newlines);
       return 0;
}

