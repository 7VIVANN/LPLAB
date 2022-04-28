%{
#include<bits/stdc++.h>
using namespace std;

int c=0;
int w=0;
int l=0;

%}

%%

[A-Za-z]	c++;
\n	l++;
.
%%
int yywrap(){}

int main()
{
	yylex();
	cout<<c<<endl;
	cout<<l<<endl;




}
