%{
    #include "gram.tab.h"
%}

%%
"."                           { printf("PUNTO:%s\n",yytext);yylval.str = strdup(yytext);return PUNTO; }
yo|tu                         { printf("PRONOM:%s\n",yytext);yylval.str = strdup(yytext);return PRONOM; }
el|un                         { printf("ART:%s\n",yytext);yylval.str = strdup(yytext);return ART;}
placidamente|rapidamente      { printf("ADV:%s\n",yytext);yylval.str = strdup(yytext);return ADV;}
corre|duerme                  { printf("VERB:%s\n",yytext);yylval.str = strdup(yytext);return VERB;}
perro|gato                    { printf("SUST:%s\n",yytext);yylval.str = strdup(yytext);return SUST;}
bello|feo                     { printf("ADJ:%s\n",yytext);yylval.str = strdup(yytext);return ADJ;}
[ \t]                         { /* ignore whitespace */ }
\n                            { printf("EOL\n");return EOL;}
.                             {}
%%
