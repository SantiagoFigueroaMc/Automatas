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
%token<num> ADD EQUIV LEQ GEQ LET EQ PRINT ADDONE MULT REST
%token<num> IF THEN FOR AND OR EOL BGNP ENDP

%type<num> NUMBER
%type<str> STRING
%type<index> NAME
%type<num> program
%type<num> line
%type<num> statement
%type<num> expression
%type<num> assign
%type<num> conditional
%type<num> print
%type<num> for

%left MULT
%left ADD
%left REST
%left ADDONE
%left OR
%left AND
%left LBR RBR

%%
the_program: BGNP program ENDP EOL;

program: { printf("Bienvenido. A continuacion vera los resultados que usted escribio en el codigo\n"); } | program line;

line: EOL| statement EOL;

statement: expression | assign | conditional | for | print;

expression:  NUMBER { $$ = $1; }
| NAME { $$ = variable_values[$1]; }
| NAME ADDONE { $$ = variable_values[$1]++; }
| expression ADD expression { $$ = $1 + $3; }
| expression EQUIV expression {$$ = $1 == $3;}
| expression LEQ expression {$$ = $1 <= $3;}
| expression GEQ expression {$$ = $1 >= $3;}
| expression expression expression { $$ = $2; };

assign: LET NAME EQ expression { $$ = set_variable($2, $4); };

conditional: IF expression THEN statement { if( ($2) != 1 ){ printf("(Falso) \n"); }
else{ $$=$4; } };

for: FOR LBR NUMBER RBR PRINT expression { for(int i = 0; i < $3; i++){
printf("%.2f\n", $6); } }  | FOR LBR NUMBER RBR PRINT STRING { for(int i = 0; i < $3; i++){
printf("%s\n",$6); } } | FOR LBR NUMBER RBR NAME ADD NUMBER { for(int i = 0; i < $3; i++){ variable_values[$5] = variable_values[$5] + $7 ;} } | FOR LBR NUMBER RBR NAME ADDONE { for(int i = 0; i < $3; i++){ variable_values[$5]++; } };

print: PRINT expression { printf("%.2f\n", $2); } | PRINT STRING { printf("%s\n",$2); };

%%

int main(int argc, char **argv){
	yyparse();
}
void yyerror(const char *s){
	fprintf(stderr, "error: %s\n", s);
}
