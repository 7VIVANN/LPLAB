%option yyline;
%{
    #include "y.tab.h"
%}

{ID} [_a-zA-Z][_a-zA-Z0-9]*
{NUM} [0-9]+

%%

int {return INT;}
char {return CHAR;}
double {return DOUBLE;}
// define rules for other grammar that dont match with identifier

NUM {yylval.vblno=atoi(yytext); return NUM;}
ID {yylval.strval=strdup(yytext);return ID;}
%%
main(){
    yyparse();
}