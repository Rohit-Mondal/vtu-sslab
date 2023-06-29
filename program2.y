%{
#include<stdio.h>
#include<stdlib.h>
int yyerror();
int yylex();
%}
%token A B
%%
S:A S|B;
%%
int main() {
printf("Enter expression:\n");
yyparse();
printf("Valid");
}
int yyerror() {
printf("Invalid exp");
exit (0);
}
