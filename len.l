%{
    # include "len.tab.h"
    # include "mem.h"
%}

%%
"("                             { return LBR;}
")"                             { return RBR;}
"Si"                            { return IF; }
"igual"                         { return EQ; }
"entonces"                      { return THEN; }
"Sea"                           { return LET; }
"equivale"                      { return EQUIV; }
"mostrar"                       { return PRINT; }
"<<<"                           { return BGNP; }
">>>"                           { return ENDP; }
"<"                             { return LOOPBGN; }
">"                             { return LOOPEND; }
"+"                             { return ADD; }
"Mientras"                      { return WHILE; }
"::"                              { return SEPARADOR; }
[0-9]+                          { yylval.num = atoi(yytext); return NUMBER; }
[A-Za-z][A-Za-z0-9_]*           { yylval.index = add_variable(yytext); return NAME; }
[a-zA-Z_]?\"(\\.|[^\\"\n])*\"   { yylval.str = strdup(yytext); return STRING;}
\n      { return EOL; }
[ \t]   { /* ignore whitespace */ }
.       { printf("Mystery character %c\n", *yytext); }
%%
