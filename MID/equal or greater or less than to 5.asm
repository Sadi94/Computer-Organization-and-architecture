ORG 100H  


KEY DB 5H
    MOV AH, 1       ;read character function
    INT 21H         ;character is in AL
    MOV KEY, AL     ;save iunput to BL register
    SUB KEY, 30H    ;convert to ASCHII value 
    
COMPAIR:
    CMP KEY, 5H
    JE EQUAL
    JL LESS
    JG GRETAER
    
EQUAL:
    MSG1: DB " IS EQUAL TO 5", 0DH,0AH,24H
    MOV DX, MSG1
    MOV AH, 09H
    INT 21H
RET

LESS:
    MSG2: DB " IS LESS THAN 5", 0DH,0AH,24H
    MOV DX, MSG2
    MOV AH, 09H
    INT 21H
RET
   

GRETAER:
    MSG3: DB " IS GREATER THAN 5", 0DH,0AH,24H
    MOV DX, MSG3
    MOV AH, 09H
    INT 21H
RET   