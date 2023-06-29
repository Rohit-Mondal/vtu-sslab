%{
#include<stdio.h>
#include<stdlib.h>
int c1=0;
%}
%%
"/*"[a-zA-z0-9' '\t\n]*"*/" { c1++; }
"//"[a-zA-z0-9' '\t]* { c1++; }
%%
int main() {
yyin = fopen("a.c", "r");
yyout = fopen("b.c", "w");
yylex();
printf("line %d", c1);
fclose(yyin);
fclose(yyout);
}
int yywrap() {
return 1;
}
