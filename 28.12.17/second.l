%{


        #include<stdio.h>
        extern FILE *yyin;
        extern FILE *yyout;
        char buf[1000], buf2[100];
        char labelcount = 'A';
        int hasWhile = 0;
        int i,j;
        int firstWhile = 0;

%}
%%

for\(.*\;.*\;.*\)\{ {
                        printf("Hello");
                        if (firstWhile != 0){
                        strcpy(buf2, "label A");
                        j = strlen(buf2);
                         buf2[j++] = ':';
                        buf2[j++] = '{';
                        buf2[j++] = '\n';
                         buf2[j++] = '\t';
                         buf2[j++] = 'i';
                         buf2[j++] = 'f';
                        printf("%s", yytext);
                        i=9;
                        while(i <=12)
                        {
                                buf2[j++] = yytext[i++];
                        }
                        //printf("%s", buf);
                        fprintf(yyout, "%s", buf2);
 }else {

                                strcpy(buf, yytext); firstWhile++;


                        fprintf(yyout, "%s", buf);

                        }

                }


while\(.*\)\{?\;? {

                printf("\n While loop detected %s\n", yytext);
                hasWhile = 1;
                if (firstWhile == 0 ){

                         strcpy(buf, yytext); firstWhile++;
                }
                else {
                strcpy(buf, "\n label ");
                i = 5;
                j = strlen(buf);
                buf[j++] = labelcount;
                buf[j++] = ':';
                buf[j++] = '{';
                buf[j++] = '\n';
                buf[j++] = '\t';
                buf[j++] = 'i';
                buf[j++] = 'f';
                strcat(buf, "\t \t");
                while( i < yyleng) {
                        buf[j++] = yytext[i++];

                        }

                }
                fprintf(yyout, "%s", buf);



}
.       {ECHO;

        }

\n  {ECHO;}

%%


int yywrap()
{
        return 1;
}

int main() {
        //yyin = fopen("whileLoop.c", "r");
        yyout = fopen("modified.c", "w");
        yylex();
        fseek(yyout,0, SEEK_END);
        fprintf(yyout,"%s" ,"goto A; \n }");
        return 0;

}

