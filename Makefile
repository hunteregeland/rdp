lexer: cobolLex.l
    flex cobolLex.l
    gcc -o Lexer lex.yy.c
    ./Lexer readInput.COB

clean:
    clear
    rm -f lex.yy.c Lexer
    ls -l