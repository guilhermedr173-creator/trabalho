%{
#include <stdio.h>
#include "atrib.tab.h"
%}

%option noyywrap

%%
[a-zA-Z][a-zA-Z0-9]*   { return ID; }
[0-9]+                 { return NUMERO; }
"="                    { return '='; }
"+"                    { return '+'; }
"-"                    { return '-'; }
"*"                    { return '*'; }
"/"                    { return '/'; }
"("                    { return '('; }
")"                    { return ')'; }
\n                     { return EOL; }
[ \t\r]+               { /* ignora espacos */ }
.                      { return yytext[0]; /* gera erro sintatico */ }
%%
