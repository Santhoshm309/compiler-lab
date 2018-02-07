%{
int count=0;
%}
letter [aeiou]
letters [qwtrypsdfghjklzxcvbnm]
var [t]
%%
({letters})*({letter})({letters})*({letter})({letters})*{var} {printf("id: %s\n", yytext);
}
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

