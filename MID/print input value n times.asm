.MODEL SMALL
.STACK 100H
.DATA

MSG DB 'ENTER A CHARACTER: $'
MSG1 DB 'THANKYOU $'
NUM DB ?

.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH, 9
    LEA DX, MSG
    INT 21H
    
    MOV AH, 1    ;input a character
    INT 21H
    MOV NUM, AL 
    
    MOV AH, 2    ;new line
    MOV DL, 10
    INT 21H  
    MOV DL, 13
    INT 21H   
    
    MOV CX, 50
    MOV AH, 2
    MOV DL, NUM
    
    L1:
    INT 21H
    LOOP L1
    
    MOV AH, 2    ;new line
    MOV DL, 10
    INT 21H  
    MOV DL, 13
    INT 21H     
    
    ;line break again
    
    MOV AH, 2    ;new line
    MOV DL, 10
    INT 21H  
    MOV DL, 13
    INT 21H
    
    MOV AH, 9
    LEA DX, MSG1 
    INT 21H
    
EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP

END MAIN