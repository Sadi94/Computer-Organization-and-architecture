;Take an input character from user. 
;Check it for number and 
;find whether it is odd or even 
;using TEST instruction.


.model small
.stack 100h
.data
msg  db "enter a character: $"
msg2 db 10,13,"not a Number $"
msg3 db 10,13,"even number $"
msg4 db 10,13,"odd number $"
var  db ?
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        lea dx,msg
        int 21h
        
        mov ah,1
        int 21h
        mov var,al
        
        cmp al,'9'
        jg notNumber
        
        cmp al,'0'
        jl notNumber
        
        testing:
        test var,01h
        
        jz  even
        jmp odd
        
        even:
        mov ah,9
        lea dx,msg3
        int 21h
        
        jmp exit
        
        odd:
        mov ah,9
        lea dx,msg4
        int 21h
        
        jmp exit
        
        
        notNumber:
        mov ah,9
        lea dx,msg2
        int 21h
        
        exit:
        main endp
    end main