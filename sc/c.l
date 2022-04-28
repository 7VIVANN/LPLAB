%{
#include "calc3.tab.h"
%}
%%
"="	{return(EQUAL);}
"+"	{return(PLUS);}
"*"	{return(TIMES);}
"("	{return(LPAREN);}
")"	{return(RPAREN);}
[\n]	{return(CR);}
[0-9]+	{yylval.value=atoi(yytext); return(INT);}
[a-z]	{yylval.name=yytext[0];return(ID); }
[\t ]	;
%%
