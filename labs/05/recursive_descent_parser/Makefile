ast:
	yacc -d ast.y
	lex ast.l
	gcc lex.yy.c y.tab.c
analyzer:
	lex lexical_analyzer.l
	gcc lex.yy.c -o lexical_analyzer -lfl

clean:
	rm a.out
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
	rm lexical_analyzer
	rm tokens.out
	rm tree.txt