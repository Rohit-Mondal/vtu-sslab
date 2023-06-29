%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
%}
%token NUM
%left '+''-'
%left '*''/'
%%
Start:E {printf("Valid Expression\n"); printf("Result=%d",$$);}
E:E'+'E {$$=$1+$3;}
  | E'-'E {$$=$1-$3;}
  | E'*'E {$$=$1*$3;}
  | E'/'E { if($3==0) {printf("Divide by 0 error"); exit (0);} else {$$ = $1/$3;}}
  | '('E')' { $$ = $2;}
  | NUM {$$=$1;}
  ;
%%
void main()
{
printf("Enter Expression:");
yyparse();
}
int yyerror()
{
printf("Invalid expression\n");
exit (0);
}
