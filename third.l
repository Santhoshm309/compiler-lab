%{
int count=0;
%}
cons [^ \t\naeiouk]
vowel [aeiou]
ltr (({cons})*({vowel})({cons})*)+
%%
({ltr})+(k)({ltr})*|({ltr})*|({ltr})*(k)({ltr})+ {printf("id: %s\n", yytext);}
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


