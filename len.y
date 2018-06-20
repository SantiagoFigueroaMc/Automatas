%{
    #include <stdio.h>
    
    extern double variable_values[100];
    extern int variable_set[100];
    
    int yylex();
    void yyerror(const char *s);
    
%}

%union{
    int index;
    double num;
    char *str;
}


%token NUMBER NAME STRING
%token<num> EQ
%token<num> ADD EQUIV LEQ GEQ LET
%token<num> IF THEN WHILE AND OR
%token<num> EOL
%token<num> BGNP ENDP PRINT

%type<num> NUMBER
%type<str> STRING
%type<index> NAME
%type<num> program
%type<num> line
%type<num> stmt
%type<num> exp
%type<num> assign
%type<num> conditional
%type<num> function

%left ADD
%left OR
%left AND
%left LBR RBR

%%
final_program: BGNP program ENDP EOL

program: {printf("");}
| program line
;

line:
EOL
| stmt EOL
;

stmt: exp
| assign
| conditional
| function
;

assign: LET NAME EQ exp { $$ = set_variable($2, $4); }
;

exp: NUMBER { $$ = $1; }
| NAME { $$ = variable_values[$1]; }
| exp ADD exp { $$ = $1 + $3; }
| exp EQUIV exp {$$ = $1 == $3;}
| exp LEQ exp {$$ = $1 < $3;}
| exp GEQ exp {$$ = $1 > $3;}
| LBR exp RBR { $$ = $2; }
;

conditional: IF exp THEN stmt {if($2){$$ = $4;}}
;

function: PRINT exp {printf("%.2f\n",$2);}
| PRINT STRING {printf("%s\n",$2);}
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
