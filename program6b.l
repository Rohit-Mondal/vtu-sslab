%{
#include<stdio.h>
#include "y.tab.h"
//int yylval;
%}
%%
[\t];
"(".*");";
"#include<stdio.h>"
[+|-|*|/|=|<|>|] { printf("Operator is %s\n", yytext); return OP; }
[0-9]+ { yylval = atoi(yytext); printf("Number is %d\n", yylval); return DIGIT; }
int|char|bool|float|void|for|do|while|if|else|return { printf("keyword is %s\n", yytext); return KEY; }
[a-zA-Z0-9]+ { printf("identifier is %s\n", yytext); return ID; }
. ;
%%
