CLS

DIM item(5) AS STRING
DIM selectedIndex AS INTEGER

item(0) = "ITEM 1"
item(1) = "ITEM 2"
item(2) = "ITEM 3"
item(3) = "ITEM 4"
item(4) = "ITEM 5"

selectedIndex = 2

GOSUB MenuPrint

KeyTrap:
 DO
 	LET k$ = INKEY$
 LOOP UNTIL k$ <> ""
 
 SELECT CASE k$
 	CASE CHR$(0) + "H"
 		GOSUB MenuUp
 	CASE CHR$(0) + "P"
		GOSUB MenuDown
	CASE CHR$(13)
		GOSUB MenuSelect
 	CASE CHR$(27)
 		CLS
 		SYSTEM
 END SELECT
 GOSUB KeyTrap
 RETURN

MenuUp:
 IF selectedIndex - 1 > -1 THEN
	selectedIndex = selectedIndex - 1
	GOSUB MenuPrint
 END IF
 RETURN

MenuDown:
 IF selectedIndex + 1 <= LEN(item) THEN
	selectedIndex = selectedIndex + 1
	GOSUB MenuPrint
 END IF
 RETURN

MenuSelect:
 CLS
 PRINT "Running: " + str$(selectedIndex)
 SLEEP 1
 GOSUB MenuPrint
 RETURN

MenuPrint:
 COLOR 7, 0
 CLS
 PRINT "Menu"
 PRINT "---------------"
 
 FOR i = 0 TO LEN(item)
 	IF i = selectedIndex THEN
 		COLOR 0, 7
 	END IF
 	PRINT RPAD$(item(i), " ", 20)
 	COLOR 7, 0
 NEXT i
 
 LOCATE 23, 1
 PRINT "Press ESC to Exit"
 RETURN

FUNCTION RPAD$ (in$, char$, cnt!)
	tmp$ = in$
	DO WHILE LEN(tmp$) <> cnt!
		tmp$ = tmp$ + char$
	LOOP
	RPAD$ = tmp$
END FUNCTION

FUNCTION LPAD$ (in$, char$, cnt!)
    tmp$ = in$
    DO WHILE LEN(tmp$) <> cnt!
        tmp$ = char$ + tmp$
	LOOP
	LPAD$ = tmp$
END FUNCTION

