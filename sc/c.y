%{

/*  
All of the below productions that do not have associated 
actions are using the DEFAULT action -- $$ = $1 
*/

int symbol_table[26];
int lookup(char);
void assign(char name,int value) ;

%}

%union {
  int value;
  char name;
}


%token PLUS TIMES CR RPAREN LPAREN EQUAL
%token <name> ID
%token <value> INT
%type <value> expr term factor

%%
lines	:	lines line
	|	line
	;
line	:	expr CR 		{printf("= %d\n",$1); }
	|	ID EQUAL expr CR 	{ assign($1,$3); }
	;
expr	:	expr PLUS term 		{$$ = $1 + $3; }
	|	term
	;
term	:	term TIMES factor	{$$ = $1 * $3; }
	|	factor
	;
factor	:	LPAREN expr RPAREN	{$$ = $2;}
	|	INT
	|	ID			{$$ = lookup($1); }
	;
%%

int lookup(char name) {
  return(symbol_table[name-'a']);
}

void
assign(char name,int value) {
  symbol_table[name-'a'] = value;
}
