%{
#include <stdio.h>
#include <stdlib.h>
#include "rel.tab.h"
%}

%option noyywrap

%%
[0-9]+      { yylval = atoi(yytext); return NUMERO; }
">="        { return MAIOR_IGUAL; }
"<="        { return MENOR_IGUAL; }
"=="        { return IGUAL; }
"!="        { return DIFERENTE; }
">"         { return MAIOR; }
"<"         { return MENOR; }
\n          { return EOL; }
[ \t\r]+    { /* ignora espacos */ }
.           { return yytext[0]; /* gera erro sintatico */ }
%%
