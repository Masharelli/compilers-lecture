%{
#ifndef YYSTYPE
#define YYSTYPE char*
#endif
#include "y.tab.h"
    //necessary to compile ast.y, this was my trouble at understanding all this
%}
%%
"floatdcl"  return(floatdcl);
"intdcl"    return(intdcl);
"inum"      return(inum);
"fnum"      return(fnum);
[\t\n]      ;
"print"     return(print);
"plus"      return(plus);
"minus"     return(minus);
"times"     return(times);
"divide"    return(divide);
";"         return(end);
"assign"    return(assign);
"id"        return(id);
%%
