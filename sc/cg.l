%{
#include "gen.tab.h"
%}
%%
[a-z]	{yylval.cval = yytext[0]; return(ID);}
[0-9]*	{yylval.ival = atoi(yytext); return (NUM);}
\:\=	{return(ASSIGN);}
\+	{return('+');}
[ \t]	;
[\n]	;
%%