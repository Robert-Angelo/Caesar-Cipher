       IDENTIFICATION DIVISION.
       PROGRAM-ID. CeasarCipher.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY. FUNCTION ALL INTRINSIC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 inputString PIC X(128).
       01 Shift PIC 9(2).
       01 encryptedString PIC X(128).
       01 aUpper PIC X(26) VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
       01 aLower PIC X(26) VALUE 'abcdefghijklmnopqrstuvwxyz'.
       01 curChar PIC 9(5).

       PROCEDURE DIVISION.
        main.
        SET inputString TO 'Hello Cobol'
        SET Shift TO 3
        PERFORM encrypt.
        SET inputString TO 'abcdefghijklmnopqrstuvwxyz'
        SET Shift TO 5
        PERFORM decrypt.
        SET inputString TO 'The Quick Brown Fox Jumps Over the Lazy Dog'
        PERFORM solve.
        STOP RUN.
    
       encrypt.
       INSPECT inputString CONVERTING aLower to aUpper.
       MOVE inputString TO encryptedString.
       PERFORM VARYING curChar FROM 1 BY 1 UNTIL curChar > LENGTH(inputString)
          
        IF encryptedString(curChar:1) EQUAL SPACE
        EXIT PERFORM CYCLE
        END-IF
       MOVE CHAR(MOD(ORD(encryptedString (curChar:1)) - ORD("A") + Shift, 26) + ORD("A")) TO encryptedString (curChar:1)
       END-PERFORM.
       ADD 1 TO shift
       DISPLAY encryptedString.

       decrypt.
       SUBTRACT 26 FROM Shift
       PERFORM encrypt.
       
       solve.
       SET shift TO 1
       PERFORM Encrypt UNTIL shift > 26.
