%{
#include <stdio.h>
%}

%token NUMERO ABRIRP CERRARP
%left '*'
%left '+'

%%

E:  T
            {
                $$ = $1;
            }
            |
            T '+' E
            {
              $$ = $1 + $3;
            }
            ;
T: ABRIRP E CERRARP
            {
                $$ = ($2);
            }
            |
            NUMERO '*' T          
            {
                $$ = $1 * $3;
            }
            |
            NUMERO
            ;
%%


main(){
  if(yyparse()==0){
    printf("Analisis Correcto\n");
  }else{
    return 1;
  }
  
}

yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}

yywrap(){
  return(1);
}