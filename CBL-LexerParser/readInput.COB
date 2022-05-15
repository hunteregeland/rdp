       IdEnTiFiCaTiOn DIVISION.
       PROGRAM-Id. READ-NAME.
       DATA DIVISION.
          FILE SECTION.
          WORKING-STORAGE SECTION.

       PROCEDURE DIVISION.
          MAIN-PROCEDURE.
           DISPLAY "Please enter your name: ".
           ACCEPT WS-INPUT.
           DISPLAY  "Nice to meet you, ", WS-INPUT.

           STOP RUN.