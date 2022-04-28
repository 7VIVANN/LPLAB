%{
    #include "y.tab.h"
    int opr_seen = 1;
    int hash(char *s)
    {
            int res = 0;
            for(int i = 0; s[i]; i++)
                    res = res * 32 + s[i];
            return res;
    }
%}

%%
([0-9])*        {
                    opr_seen = 0;
                    yylval = atoi(yytext);
                    return NUM;
                }
"let"           {
                    return LET;
                }
"display"       {
                    return DISPLAY;
                }
([a-zA-Z][a-zA-Z0-9\_]*) {
                            opr_seen = 0;
                            yylval = hash(yytext);
                            return ID;
                         }
"="             {
                    return AS;
                }
[ \t\n]         {}
"("             {
                    opr_seen = 1;
                    return OB;
                }
")"             {
                    opr_seen = 0;
                    return CB;
                }
"^"             {
                    opr_seen = 1;
                    return EXP;
                }
"*"             {
                    opr_seen = 1;
                    return MUL;
                }
"/"             {
                    opr_seen = 1;
                    return DIV;
                }
"+"             {
                    opr_seen = 1;
                    return ADD;
                }
"-"             {
                    if(opr_seen)
                        return UM;
                    else
                    {
                        opr_seen = 1;
                        return SUB;
                    }
                }
%%
