%{
#include <stdio.h>
#include <stdlib.h>
#include "calc.tab.h"
%}

%option noyywrap

NUM   [0-9]+(\.[0-9]+)?

%%
{NUM}       { yylval = atof(yytext); return NUMERO; }
"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
"("         { return '('; }
")"         { return ')'; }
\n          { return EOL; }
[ \t\r]+    { /* ignora espacos */ }
.           { printf("Caractere invalido: '%s'\n", yytext); }
%%
