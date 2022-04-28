%{
#include<bits/stdc++.h>
#include <stdlib.h>
#include "node.h"
void yyerror(char *);
#include "y.tab.h"
char s[]="invalid character";
using namespace std;
extern map<char,int >mp;
%}
%%
int {return INT;}
float {return FLOAT;}
bool {return BOOL;}
"&&" {return AND;}
"||" {return OR;}
"!" {return NOT;}
break {return BREAK;}
if {yylval.d.place=yytext;
return IF;
}
else {yylval.d.place=yytext;
return ELSE;
}
then { yylval.d.place=yytext;
return THEN;
}
do {
yylval.d.place=yytext;
return DO;
}
while { yylval.d.place=yytext;
return WHILE;
}
case {
yylval.d.place=yytext;
return CASE;
}
switch {
yylval.d.place=yytext;
return SWITCH;
}
for {
yylval.d.place=yytext;
return FOR;
}
"true"|"false" {
yylval.d.place = yytext;
return BOOL_VAL;
}
[a-zA-Z][a-zA-Z0-9]* {
yylval.d.place = yytext;
return VARIABLE;
}
[0-9]+"."+[0-9]+ {
yylval.d.place = yytext;
return FLOAT_VAL;
}
[0-9]+ {
yylval.d.place = yytext;
return INT_VAL;
}
"==" {yylval.d.place=yytext;return ee;}
"<=" {yylval.d.place=yytext;return le;}
">=" {yylval.d.place=yytext;return ge;}
"!=" {yylval.d.place=yytext;return ne;}
"+=" {yylval.d.EXTRA.op_val=2;return op;}
"-=" {yylval.d.EXTRA.op_val=3;return op;}
"*=" {yylval.d.EXTRA.op_val=4;return op;}
"/=" {yylval.d.EXTRA.op_val=5;return op;}
"=" {yylval.d.place=yytext;return *yytext;}
[-+*/&|~^<>@{};] {
yylval.d.place=yytext;
return *yytext;
}
[()\n#,?:] {return *yytext; }
[ \t] {;}
. yyerror(s);
%%
int yywrap(void)
{
return 1;
}
