%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>  
#define NUMSYM 20

struct symtab{
    char *name;
    double value;
} symtab[NUMSYM];

struct symtab* symlook();
%}

%union{
    double dval;
    struct symtab* symp;
}

%token <symp> NAME
%token <dval> NUM

%type <dval> expr
%type <dval> term
%type <dval> factor

%token  CHAR FLOAT INT DOUBLE

%%

stmt_list: 
    stmt '\n'
    |
    stmt_list stmt '\n';
stmt:
    NAME '=' expr { $1->value=$3;}
    |
    expr {printf(" =%g\n", $1);}
expr: 
    expr '+' term {$$ = $1 + $3;}
    |
    expr '-' term {$$ = $1 - $3;}
    |
    term ;
term: 
    term '*' factor {$$=$1*$3;}
    |
    term '/' factor {
                    if($3==0)
                        yyerror("Divide by zero");
                    else
                        $$=$1/$3;
                }
    |    
    factor ;
factor:
    '(' expr ')' { $$ = $2 ;}
    |
    '-' factor  { $$ = -$2 ;}
    |
    NUM   
    |
    NAME { $$ = $1->value ;}  
%%
void yyerror(char *msg){
        printf("Line no: %d error: %s", yylineno, msg);
}
int yywrap(){
    return 1;
}
int main(){
    yyparse();
    return 0;
}
struct symtab *symlook(char *s) 
{ // this is where the error is
    char *p;
    struct symtab *sp;

    for(sp = symtab; sp < &symtab[NUMSYM]; sp++){
        if(sp -> name && !strcmp(sp->name, s))
            return sp;

    if(!sp->name) {
        sp->name = strdup(s);
        return sp;
        }
}