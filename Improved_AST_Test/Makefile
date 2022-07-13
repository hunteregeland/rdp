all: parser

lexOut: lexer
	./lexer test-prog.cmm -d

lex.yy.c: myLexer.l myParser.tab.h
	flex -l myLexer.l

lexer: lex.yy.c
	gcc -o lexer lex.yy.c

myParser.tab.c myParser.tab.h:	myParser.y
	bison -t -v -d myParser.y

parser: lex.yy.c myParser.tab.c myParser.tab.h myAST.h
	gcc -o parser myParser.tab.c lex.yy.c 
	./parser classTestSmall.cmm > parserOutput.txt

clean:
	rm -f parser lexer myParser.tab.c lex.yy.c myParser.tab.h myParser.output parserOutput.txt
	ls -l