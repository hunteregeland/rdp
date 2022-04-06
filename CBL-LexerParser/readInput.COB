       IDENTIFICATION DIVISION.
       PROGRAM-ID. READ-NAME.
       DATA DIVISION.
          FILE SECTION.
          WORKING-STORAGE SECTION.
          01 WS-INPUT    PIC A(20).

       PROCEDURE DIVISION.
          MAIN-PROCEDURE.
           DISPLAY "Please enter your name: ".
           ACCEPT WS-INPUT.
           DISPLAY  "Nice to meet you, ", WS-INPUT.

           STOP RUN.

       END PROGRAM READ-NAME.
