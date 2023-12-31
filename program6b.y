%{
#include<stdio.h>
#include<stdlib.h>
int id = 0, dig = 0, key = 0, op = 0;
int yylex();
int yyerror();
extern FILE *yyin;
%}
%token DIGIT ID KEY OP
%%
input:
    DIGIT input { dig++; }
    | ID input { id++; }
    | KEY input { key++; }
    | OP input { op++; }
    | DIGIT { dig++; }
    | ID { id++; }
    | KEY { key++; }
    | OP { op++; }
    ;
%%
void main() {
yyin=fopen("a.c","r");
yyparse();
printf("numbers = %d\nkeyword = %d\nidentifier = %d\noperator = %d\n", dig, key, id, op);
}
int yyerror() {
    printf("EEK; parse error! Message:");
    exit(-1);
}
