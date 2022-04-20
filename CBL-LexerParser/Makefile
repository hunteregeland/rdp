all: parser

smallCobolParser.tab.c smallCobolParser.tab.h: smallCobolParser.y
	bison -t -v -d smallCobolParser.y

lex.yy.c: smallCobolLex.l smallCobolParser.tab.h
	flex smallCobolLex.l

parser: lex.yy.c smallCobolParser.tab.c smallCobolParser.tab.h
	gcc -o parser smallCobolParser.tab.c lex.yy.c
	./parser cobolTestFile.cob

clean:
	clear
	rm -f lex.yy.c lexer smallCobolParser.tab.c lex.yy.c smallCobolParser.tab.h parser.output backupParser.tab.h backupParser.tab.c backupLexer.l backupParser.output
	ls -l

backupParser.tab.c backupParser.tab.h: backupParser.y
	bison -t -v -d backupParser.y

backup.lex.yy.c: backupSmallCobolLex.l backupParser.tab.h
	flex backupSmallCobolLex.l

backup: backup.lex.yy.c backupParser.tab.c backupParser.tab.h
	gcc -o parser backupParser.tab.c lex.yy.c
	./parser cobolTestFile.cob