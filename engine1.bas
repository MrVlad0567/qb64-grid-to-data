SCREEN 12
FOR x = 1 TO 20
    LINE (x * 32, 0)-(x * 32, 479), 15
NEXT
FOR y = 1 TO 15
    LINE (0, y * 32)-(639, y * 32), 15
NEXT
SLEEP
CLS
DO
    _LIMIT 300
    DO WHILE _MOUSEINPUT
        IF _MOUSEBUTTON(1) THEN
            FOR y = 0 TO 14
                FOR x = 0 TO 19
                    IF _MOUSEX >= x * 32 AND _MOUSEX <= x * 32 + 32 AND _MOUSEY <= y * 32 + 32 AND _MOUSEY >= y * 32 THEN
                        LINE (x * 32, y * 32)-(x * 32 + 31, y * 32 + 31), 15, BF
                    END IF
                NEXT
            NEXT
        END IF
        IF _MOUSEBUTTON(2) THEN
            FOR y = 0 TO 14
                FOR x = 0 TO 19
                    IF _MOUSEX >= x * 32 AND _MOUSEX <= x * 32 + 32 AND _MOUSEY <= y * 32 + 32 AND _MOUSEY >= y * 32 THEN
                        LINE (x * 32, y * 32)-(x * 32 + 31, y * 32 + 31), 0, BF
                    END IF
                NEXT
            NEXT
        END IF
        IF _KEYDOWN(113) THEN CLS
    LOOP
LOOP UNTIL _KEYDOWN(101)
DIM pic(300) AS INTEGER
n = 1
FOR y = 0 TO 14
    FOR x = 0 TO 19
        IF POINT(x * 32 + 16, y * 32 + 16) = 15 THEN
            pic(n) = 15
            n = n + 1
        ELSE
            pic(n) = 0
            n = n + 1
        END IF
    NEXT
NEXT
CLS
INPUT "file name:", file$
n = 1
text$ = "data"
OPEN file$ + ".txt" FOR OUTPUT AS #1
FOR i = 0 TO 14
    FOR j = 0 TO 19
        IF j <> 19 THEN
            text$ = text$ + STR$(pic(n + j)) + ","
        ELSE
            text$ = text$ + STR$(pic(n + j))
        END IF
    NEXT
    PRINT #1, text$
    n = n + 20
    text$ = "data"
NEXT
