%{
	int count=0;
%}
letter [dD]
letters [a-zA-Z]
space [ /t/n]+
%%
{letter}{letters}* {printf("id: %s \n", yytext);
	count++;}
	[^ \t\n]+ "";           
%%
int yywrap(void)
{
	return 1;
}
int main() {
	yylex();
	printf("Number of words starting with 'd' = %d\n", count);
	return 0;
}


