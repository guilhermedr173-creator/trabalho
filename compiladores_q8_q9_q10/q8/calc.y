%{
#include <stdio.h>

int  yylex(void);
void yyerror(const char *s);
%}

%define api.value.type {double}

%token NUMERO EOL

/* Menor precedencia no topo, maior embaixo */
%left '+' '-'
%left '*' '/'
%precedence UMINUS

%%

entrada:
      %empty
    | entrada linha
    ;

linha:
      EOL
    | expr EOL        { printf("Resultado: %g\n", $1); }
    | error EOL       { yyerrok; }
    ;

expr:
      NUMERO
    | expr '+' expr   { $$ = $1 + $3; }
    | expr '-' expr   { $$ = $1 - $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    | expr '/' expr   {
          if ($3 == 0) { yyerror("divisao por zero"); YYERROR; }
          $$ = $1 / $3;
      }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | '(' expr ')'    { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    printf("Erro: %s\n", s);
}

int main(void) {
    printf("Calculadora (Ctrl+D para sair)\n");
    yyparse();
    return 0;
}
