lexer: lexer.l
    flex lexer.l
    gcc -o lexer lex.yy.c
    ./lexer readInput.COB

clean:
    clear
    rm -f lex.yy.c lexer
    ls -l