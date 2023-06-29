%{
#include<stdio.h>
#include<stdlib.h>
int cid=0, cop=0, cbr=0;
%}
%%
[+*] { cop++; printf("\noperator is %s", yytext);}
[0-9]*[.]?[0-9]+ { cid++; printf("\noperand is %s", yytext);}
[(] {cbr++;}
[)] {cbr--;}
[.|\n] {return cid, cop, cbr;}
%%
int yywrap()
{
return 1;
}
int main() {
printf("enter expression\n");
yylex();
if (cbr !=0 || cop >=cid || cid ==0) {
printf("invalid expression\n");
exit (0);
}
else {
printf("\nvalid expression");
printf("\nno of operator %d\n", cop);
printf("\nno of identifiers %d\n", cid);
return 0;
}
}
