%{
  #include "dstruct.h"
  #include "y.tab.h"
  #include <string.h>
%}
%s CL VAR METHOD 
%%
[ \t\n]*  {}
CLASS       {BEGIN CL;
             return CLASS; }
CRC         {

             return CRC; }
END         {return END; }
RESPONSIBILITY {BEGIN METHOD;return RESPONSIBILITY; }
COLABRATION    {return COLABRATION; }
INT            {BEGIN VAR;return INT; }
CHAR           {BEGIN VAR;return CHAR; }
"*"            {return PTR; }
USING          {return USING; }
HAS_A          {return HAS_A; }
KIND_OF        {return KIND_OF; }
<CL>[a-zA-Z][a-zA-Z0-9]*  {BEGIN INITIAL;
                strcpy(yylval.stval,yytext);
                return CLASSNAME; }
<VAR>[a-zA-Z][a-zA-Z0-9]* {BEGIN INITIAL; 
                           strcpy(yylval.stval,yytext);
                           return VARIABLE; }
<METHOD>[a-zA-Z][a-zA-Z0-9]* {BEGIN INITIAL;
                   strcpy(yylval.stval,yytext);
                   return METHODNAME; } 
[a-zA-Z][a-zA-Z0-9]*  { return STRING; }
%%
int yywrap(void)
{return 1;
}