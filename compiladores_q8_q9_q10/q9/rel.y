%{
#include <stdio.h>

int  yylex(void);
void yyerror(const char *s);
%}

%define api.value.type {int}

%token NUMERO EOL
%token MAIOR MENOR MAIOR_IGUAL MENOR_IGUAL IGUAL DIFERENTE

%%

entrada:
      %empty
    | entrada linha
    ;

linha:
      EOL
    | expressao EOL   { printf("Expressão válida!\n"); }
    | error EOL       { printf("Expressão inválida!\n"); yyerrok; }
    ;

expressao:
      NUMERO operador NUMERO
    ;

operador:
      MAIOR | MENOR | MAIOR_IGUAL | MENOR_IGUAL | IGUAL | DIFERENTE
    ;

%%

void yyerror(const char *s) {
    (void)s;   /* a mensagem e tratada na regra 'error EOL' */
}

int main(void) {
    printf("Digite uma expressao relacional (Ctrl+D para sair)\n");
    yyparse();
    return 0;
}
