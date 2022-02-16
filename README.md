# file directory
- *TESTFILES* is the folder that holds all of our cobol test files from paychex
- *readInput.COB* is a simple COBOL program used to test the lexer
- *backup.txt* is a temporary file used to save backups when making large-scale changes
- *Makefile* allows for the use of *make* in the terminal to make running programs a quicker process

- *cobolLex.l* is the COBOL Lexer
- *lex.yy.c* is the file created by flex used in the lexer

- *cobolParser.y* is the smaller version of the parser for testing in cobol
