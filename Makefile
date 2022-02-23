all: parser

parser.tab.c parser.tab.h: parser.y
	bison -t -v -d parser.y

lex.yy.c: smallLex.l parser.tab.h
	flex smallLex.l


parser:	lex.yy.c parser.tab.c parser.tab.h
	gcc -o parser parser.tab.c lex.yy.c
	./parser textfile



cparser: lex.yy.c parser.tab.c parser.tab.h
	gcc -o parser parser.tab.c lex.yy.c
	./parser textfile

clean:
	clear
	rm -f lex.yy.c lexer parser.tab.c lex.yy.c parser.tab.h parser.output
	ls -l