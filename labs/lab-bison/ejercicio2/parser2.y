%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int  yylex(void);
void yyerror(const char *msg) { fprintf(stderr, "Error: %s\n", msg); }
%}

/*
 * %union define los posibles tipos que puede tener yylval.
 * Cada token o no-terminal puede usar un miembro distinto de la union.
 * Bison se encarga de que $N acceda automáticamente al miembro correcto.
 */
%union {
    int  int_val;
    char str_val[64];  /* TODO 1 — Miembro para cadenas */
}

/* Declaración de tokens con su tipo semántico */
%token <int_val>  NUM
%token <str_val>  IDENT  /* TODO 2 — Token IDENT asignado a str_val */

%%

input:
    /* vacío */
  | input item
  ;

item:
    NUM '\n'    { printf("Numero: %d\n", $1); }
  | IDENT '\n'  { printf("Identificador: %s\n", $1); }  /* TODO 4 — Imprimir identificador */
  ;

%%

int main(void) {
    return yyparse();
}
