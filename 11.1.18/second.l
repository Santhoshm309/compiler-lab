%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<fcntl.h>
char temp[100];
char fc[100];
int i=0,j=0,k=0;
char firstCondition[100];
char secondCondition[100];
char ifcond[100];
char body[100];
int i1;
char secondCondition[100];
int firstConditionFlag=0;
int secondConditionFlag=0;
%}

%%

if\(.*\)[ \n]\{[\n].*[ \n]\{.*[ \n].*[ \n]\}[ \n]\}     {
                                                                strcpy(temp,yytext);
                                                                for(i=0;temp[i]!='(';i++);
                                                                k=0;
                                                                for(j=i;temp[j]!=')';j++){
                                                                        fc[k]=temp[j];
                                                                        k++;
                                                                }
                                                fc[k]=')';
                                                fc[k+1]='\0';
                                                //printf("%s",fc);
                                                /*if(firstConditionFlag==1){
                                                        secondConditionFlag=1;
                                                }else{
                                                        firstConditionFlag=1;
                                                        strcpy(firstCondition,fc);
                                                }*/
                                                //printf("\nj=%d",j);
                                                for(k=j+1;temp[k]!='(';k++){
                                                        //printf("%c",temp[k]);
                                                        if(temp[k]=='(')
                                                                break;
  }
                                                j=0;
                                                //printf("\n k=%d",k);
                                                for(i=k;temp[i]!=')';i++){
                                                        secondCondition[j]=temp[i];
                                                        j++;
                                                }
                                                i1=i;
                                                secondCondition[j]=')';
                                                secondCondition[j+1]='\0';
                                                //printf("\n sc=%s\n j=%d",secondCondition,j);
                                                for(i=i1;temp[i]!='{';i++);
                                                j=0;

                                                for(k=i;temp[k]!='}';k++){
                                                        body[j]=temp[k];
                                                        j++;
                                                }
                                                body[j]='}';
                                                body[j+1]='\0';

                                                printf("if( %s && %s ) %s ",fc,secondCondition,body);

                                        }




. ECHO;

%%
int yywrap(){
        return 1;
}
int main(){
        yylex();
}

