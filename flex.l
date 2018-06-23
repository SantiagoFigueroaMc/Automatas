%{
	#include "bison.tab.h"
	#include "mem.h"
%}

%%
"<-"                            { return LBR; }
"->"                            { return RBR; }
"Sabemos_que"                   { return LET; }
"es"                            { return EQ; }
"sumar"                         { return ADD; }
"mas_uno"    					{ return ADDONE;}
"es_igual_a"                    { return EQUIV; }
"es_mayor_a"					{ return GEQ; }
"es_menor_a"					{ return LEQ; }
"mostrar"                       { return PRINT; }
"<<<"                   		{ return BGNP; }
">>>"                  			{ return ENDP; }
"Si_pasa_que"                   { return IF; }
"y"								{ return AND; }
"o"								{ return OR; }
"luego"                         { return THEN; }
"Para_cada_numero_menor_a"      { return FOR; }
[0-9]+                          { yylval.num = atoi(yytext); return NUMBER; }
[A-Za-z][A-Za-z0-9_]*           { yylval.index = add_variable(yytext); return NAME; }
[a-zA-Z_]?\"(\\.|[^\\"\n])*\"   { yylval.str = strdup(yytext); return STRING;}
\n      { return EOL; }
[ \t]   { /* ignore whitespace */ }
.       { printf("Mystery character %c\n", *yytext); }
%%
