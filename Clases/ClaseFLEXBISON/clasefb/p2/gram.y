%{
    #include <stdio.h>
    int yylex();
    void yyerror(const char *s);
%}

%union{
    char *str;
}

%token<str> SUST PRONOM ART ADV ADJ VERB PUNTO EOL

%%
frase: sujeto predicado PUNTO EOL {printf("La frase cumple con la gramatica\n");}
;

sujeto: ART SUST {printf("sujeto: %s %s\n",$1,$2);}
;

predicado: VERB ADV {printf("predicado: %s %s\n",$1,$2);}
;

%%
int main(int argc, char **argv)
{
    yyparse();
}
void yyerror(const char *s)
{
    fprintf(stderr, "error: %s\n", s);
}
