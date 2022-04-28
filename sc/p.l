%option yylineno
%{
    #include "p.tab.h"
    #include <math.h>
%}

NAME [_a-zA-Z][_a-zA-Z0-9]*
NUM [0-9]+

%%

int {return INT;}
char {return CHAR;}
double {return DOUBLE;}
{NUM} {yylval.dval=atof(yytext); return NUM;}
{NAME} {yylval.symp=symlook(yytext);return NAME;}
. {return yytext[0];}
%%
int main(){
    yyparse();
    return 0;
}
