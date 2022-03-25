all: parser

parser.tab.c parser.tab.h: smallCobolparser.y
	bison -t -v -d parser.y

lex.yy.c: smallCobolLex.l parser.tab.h
	flex smallCobolLex.l

parser: lex.yy.c parser.tab.c parser.tab.h
	gcc -o parser parser.tab.c lex.yy.c
	./parser cobolTestFile.cob

clean:
	clear
	rm -f lex.yy.c lexer parser.tab.c lex.yy.c parser.tab.h parser.output
	ls -l