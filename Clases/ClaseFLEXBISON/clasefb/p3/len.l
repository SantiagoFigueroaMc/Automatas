%{
    # include "len.tab.h"
    # include "mem.h"
%}

%%
"<-"                            { return LBR;}
"->"                            { return RBR;}
"sabemos_que"                   { return LET; }
"es"                            { return EQ; }
"sumar"                         { return ADD; }
"es_igual_a"                    { return EQUIV; }
"mostrar"                       { return PRINT; }
"EmpiezaAqui"                   { return BGNP; }
"TerminaAqui"                   { return ENDP; }
"Si_pasa_que"                   { return IF; }
"luego"                         { return THEN; }
"Mientras"|"durante"            { return FOR; }
[0-9]+                          { yylval.num = atoi(yytext); return NUMBER; }
[A-Za-z][A-Za-z0-9_]*           { yylval.index = add_variable(yytext); return NAME; }
[a-zA-Z_]?\"(\\.|[^\\"\n])*\"   { yylval.str = strdup(yytext); return STRING;}
\n      { return EOL; }
[ \t]   { /* ignore whitespace */ }
.       { printf("Mystery character %c\n", *yytext); }
%%
