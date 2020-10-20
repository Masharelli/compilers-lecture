%{
#include <stdio.h>
#include "y.tab.h"
int c;
extern int yylval;
%}

%%
[0-9]+  {yylval = atoi(yytext); return NUMERO;}
\(       {return ABRIRP;}
\)       {return CERRARP;}
[\t]
\n return 0;
. return yytext[0];
%%