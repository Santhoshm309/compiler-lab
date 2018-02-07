%{

char text[100];
int n = 0;
%}

%%

(\(int[ ]([a-z])) {int i; for(i = 1; i <=yyleng - 1; i++){
                        text[n] = yytext[i];
                        n++;
                }
                yyless(yyleng-2);}
. ECHO;
\n ECHO;

%%
int yywrap(void)
{
return 1;
}
int main(int argc, char *argv[]){

        yyin = fopen(argv[1], "r");
        yyout = fopen(argv[2], "w");
        yylex();
        //fclose(yyout);
//      yyout = fopen(argv[2], "a");
        fseek(yyout,39, SEEK_SET);
        char c;

        fputc(';', yyout);
        fputs(text, yyout);
        fputc(';', yyout);
        fputc('\n', yyout);
        fputs("for(", yyout);





        return 0;
}

