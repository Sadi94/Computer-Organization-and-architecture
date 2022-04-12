key DB 32H
MSG DB "ENTER A CHARACTER: ?"
TOTAL DB 0
VALUE DB 0

;MSG2: db "Thank you,",   0Dh,0Ah, 24h

       MOV  AH, 1   ;read the character 
       int 21h      ;character is in AL
       MOV MSG,AL   ;save input to BL reg
COMPAIR:  
    cmp key, 0H
    JNE PRINT
    JE CLOSE 
PRINT:
    MOV AH,2        ; display character 
    MOV DL, MSG     ; retrieve character
    INT 21H 
    
    DEC KEY
    JMP COMPAIR

close:
    ;MOV DX, MSG2
    RET 
    
       
ret