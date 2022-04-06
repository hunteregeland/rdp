all: parser

smallCobolParser.tab.c smallCobolParser.tab.h: smallCobolParser.y
	bison -t -v -d smallCobolParser.y

lex.yy.c: smallCobolLex.l smallCobolParser.tab.h
	flex smallCobolLex.l

parser: lex.yy.c smallCobolParser.tab.c smallCobolParser.tab.h
	gcc -o parser smallCobolParser.tab.c lex.yy.c
	./parser readInput.cob

clean:
	clear
	rm -f lex.yy.c lexer smallCobolParser.tab.c lex.yy.c smallCobolParser.tab.h parser.output
	ls -l