%{
#include <stdio.h>
%}

%union{
  int ival;
  char cval;
}
%token <cval> ID
%token <ival> NUM 
%token ASSIGN
%type <ival> expr
%left '+'
%%
s:   ID ASSIGN expr {printf("sw $t%d,%c\n",$3,$1); }	
	;
expr:		ID
	{$$=get_reg(); printf("lw $t%d,%c\n",$$,$1);}
	|	NUM
	{$$=get_reg(); printf("li $t%d,%d\n",$$,$1); }
	|	expr '+' expr
	{printf("add $t%d,$t%d,$t%d\n",$1,$1,$3);$$ = $1; free_reg($3);}
	;
%%

main() {
   printf("Input a string of the form:  ID := expr\n");
   printf("    where ID is a single character and \n");
   printf("    expr only uses the '+' operator on ID and integers\n");
   printf("The generated code is incomplete and will not run in the\n spim interpreter\n\n> ");

  yyparse();
}
int regs[10] = {0,0,0,0,0,0,0,0,0,0};

int
get_reg() {
  int i;
  for (i=0;i<10;i++) 
    if (regs[i] == 0) {regs[i] = 1;  return i;}
  return 0;   /* if no free register, return register 0 */
}

free_reg(int i) {
   regs[i] = 0;
}
