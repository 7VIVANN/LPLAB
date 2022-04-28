%{
    #include <stdio.h>
    #include <stdlib.h>

    int ifst[100] = {0};
    int nc = 0;
    int var[100];
    int val[100];
    int varc = 0;

    extern int yylex();
    extern int yyparse();
    void yyerror(const char* s);

    void add_to_table(int hash, int value)
    {
        var[varc] = hash;
        val[varc] = value;
        varc++;
    }
    int get_val(int hash)
    {
        for(int i = 0; i < varc; i++)
            if(var[i] == hash)
                return val[i];
    }
    void mod_table(int hash, int value)
    {
        for(int i = 0; i < varc; i++)
            if(var[i] == hash)
            {
                val[i] = value;
                return;
            }
    }
    int bpow(int a, int b)
    {
        int res = 1;
        while(b > 0)
        {
            if(b & 1)
                res *= a;
            a *= a;
            b >>= 1;
        }
        return res;
    }
%}

%token NUM ID IF DISPLAY LET UMINUS SUB ADD MUL DIV EXP OB CB AS GT LT EQ NEQ NL

%%

STS :
    | STS ST NL
    ;
ST  : E { if(!ifst[nc]) printf("%d\n", $1); }
    | LET ID AS E   { if(!ifst[nc]) add_to_table($2, $4); }
    | ID AS E   { if(!ifst[nc]) mod_table($1, $3); }
    | DISPLAY ID    { if(!ifst[nc])  printf("%d\n", get_val($2)); };
    | IF OB BE CB   { nc++; if(!$3) ifst[nc] = 1; } ST { ifst[nc] = 0; nc--; }
    ;
E   : E ADD T   { $$ = $1 + $3; }
    | E SUB T   { $$ = $1 - $3; }
    | T { $$ = $1; }
    ;
T   : T MUL F   { $$ = $1 * $3; }
    | T DIV F   { $$ = $1 / $3; }
    | F { $$ = $1; }
    ;
F   : X EXP F   { $$ = bpow($1, $3); }
    | X
    ;
X   : OB E CB   { $$ = $2; }
    | UMINUS X  { $$  = -$2; }
    | ID    { $$ = get_val($1); }
    | NUM   { $$ = $1; }
    ;
BE  : E GT E    { $$ = $1 > $3; }
    | E LT E    { $$ = $1 < $3; }
    | E EQ E    { $$ = $1 == $3; }
    | E NEQ E   { $$ = $1 != $3; }
    ;

%%

int main(void)  
{ 
    return yyparse(); 
}

void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s\n", s);
	exit(1);
}
