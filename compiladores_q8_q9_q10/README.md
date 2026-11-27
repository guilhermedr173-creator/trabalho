# Compiladores – Recuperação P1 (questões 8, 9 e 10)

Cada pasta tem um programa Flex + Bison. Para compilar (Linux/WSL):

```bash
# Questão 8 – calculadora
cd q8 && bison -d calc.y && flex calc.l && gcc calc.tab.c lex.yy.c -o calc && ./calc

# Questão 9 – expressões relacionais
cd q9 && bison -d rel.y && flex rel.l && gcc rel.tab.c lex.yy.c -o rel && ./rel

# Questão 10 – atribuição de variáveis
cd q10 && bison -d atrib.y && flex atrib.l && gcc atrib.tab.c lex.yy.c -o atrib && ./atrib
```

Digite uma expressão por linha; Ctrl+D encerra.
Pré-requisitos: `sudo apt install flex bison gcc`
