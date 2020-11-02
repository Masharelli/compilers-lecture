%{
#include <stdio.h>
extern FILE *yyin, *yyout; 

%}
%start list
%token intdcl floatdcl
%token inum fnum
%token id plus minus times divide power
%token assign print
%token end
%right id
    //%left plus minus
    //%left times divide
    //%right power
%%
list:
    | list stat {fprintf(yyout, "List->{List, Stat}\n");}
    ;

stat:
    id assign expr {fprintf(yyout, "Stat->{id, \*=\*, Expr}\n");}
    |
    intdcl id {fprintf(yyout, "Stat->{intdcl, id}\n");}
    |
    floatdcl id {fprintf(yyout, "Stat->{floatdcl, id}\n");}
    |
    print id {fprintf(yyout, "Stat->{print, id}\n");}
    ;

expr:
    '(' expr ')'
    |
    expr times expr {fprintf(yyout, "Expr->{Expr, \"*\" Expr}\n");}
    |
    expr divide expr {fprintf(yyout, "Expr->{Expr, \"/\" Expr}\n");}
    |
    expr plus expr {fprintf(yyout, "Expr->{Expr, \"+\" Expr}\n");}
    |
    expr minus expr {fprintf(yyout, "Expr->{Expr, \"-\" Expr}\n");}
    |
    id {fprintf(yyout, "Expr->{id}\n");}
    |
    number {fprintf(yyout, "Expr->{Number}\n");}
    ;
number:
    inum {fprintf(yyout, "Number->{inum}\n");}
    |
    fnum {fprintf(yyout, "Number->{fnum}\n");}


%%

int main (int argc, char** argv) { 

    extern FILE *yyin, *yyout; 
    if (argc == 2){
        yyin = fopen(argv[1], "r");
        yyout = fopen("tree.txt", "w");
        yyparse();
    } else{
        yyparse();
    }
}


int yyerror (char *s) {
    fprintf (stderr, "%s\n", s);
} 

yywrap(){
  return(1);
}