%{
#include <stdio.h>
%}

    //lex analyzer from earlier homework
    
floatdcl [f]
intdcl [i]
assign [=]
print [p]
plus [+]
minus [-]
times [*]
divide [/]
id [a-eg-hj-oq-z]+
inum [0-9]+
fnum [0-9]+["."][0-9]+



%%

"//".* {}
{floatdcl} {fprintf(yyout, "floatdcl ");}
{intdcl} {fprintf(yyout, "intdcl ");}
{assign} {fprintf(yyout, "assign ");}
{print} {fprintf(yyout, "print ");}
{plus} {fprintf(yyout, "plus ");}
{minus} {fprintf(yyout, "minus ");}
{times} {fprintf(yyout, "times ");}
{divide} {fprintf(yyout, "divide ");}
{id} {fprintf(yyout, "id ");}
{inum} {fprintf(yyout, "inum ");}
{fnum} {fprintf(yyout, "fnum ");}

%%

int main(int argc, char** argv){

    extern FILE *yyin, *yyout; 
    if (argc == 2){
        yyin = fopen(argv[1], "r");
        yyout = fopen("tokens.out", "w");
        yylex();
    } else if (argc == 1){
        yyout = fopen("tokens.out", "w");
        yylex();
    } else{
        printf("Wrong usage of arguments [./lexical_scan (input)] or [./lexical_scan < input] \n");
    }
    
    
    return 0;
}