%{
    #include <stdio.h>
%}
%%
[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4} {printf("%s\n",yytext);}
.
%%
int main(int argc, char **argv)
{
    yylex();
}
