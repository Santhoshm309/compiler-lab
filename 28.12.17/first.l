%{
 int firstloop;
 int secondloop;
 char temp[100];
%}
%%
(for|while) {
             if(firstloop==0){
                 firstloop=1;
                   ECHO;
             }
                else {
                if(firstloop==1){
                  secondloop=1;
                  strcpy(temp,yytext);
                  printf("label:\nif");
                          }
            }
           }

\}       {
           if(secondloop==1){
               printf("goto label;\n}");
              secondloop=0;
              }
          else
            {
             ECHO;
            }
         }
          .ECHO; 
%%
 int main(){
 yyin=fopen("input.c","r");
 yylex();
 return 0;
}

