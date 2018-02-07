%{
	int count=0;
%}
vowel [aeiou]
cons [qwrtypsdfghjklzxcvbnm]
%%
({cons}|{vowel})*({vowel})+({cons})* {printf("id: %s\n", yytext);
                        		count++;
	}
[^ \t\n]+ "";
%%
int yywrap(void)
{
	return 1;
}
int main() {
	yylex();
	printf("Number of words starting with 'vowels' = %d\n", count);
	return 0;
}


