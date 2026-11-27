%{
#include <stdio.h>

int  yylex(void);
void yyerror(const char *s);
%}

%token ID NUMERO EOL

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
    | ID '=' expr EOL  { printf("Comando de atribuição sintaticamente correto!\n"); }
    | error EOL        { printf("Comando de atribuição sintaticamente INCORRETO!\n"); yyerrok; }
    ;

expr:
      ID
    | NUMERO
    | expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '-' expr %prec UMINUS
    | '(' expr ')'
    ;

%%

void yyerror(const char *s) {
    (void)s;
}

int main(void) {
    printf("Digite um comando de atribuicao (Ctrl+D para sair)\n");
    yyparse();
    return 0;
}
