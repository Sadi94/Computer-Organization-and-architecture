;Write a program to display a "?",
; read two capital letters, and display
; them on the next line In alphabetical order. 
;Hints: use cmp, jg, xchg

;Input:AB Output:BA

.model small
.stack 100h
.data
msg db "? $"
msg2 db 10,13,"Enter Character: $"
msg3 db 10,13,"Thank You $"
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        lea dx,msg
        int 21h
        
        mov ah,9
        lea dx,msg2
        int 21h
        
        mov ah,1
        int 21h
        mov bl,al
        
        mov ah,1
        int 21h
        mov bh,al
        
        cmp bl,bh
        jg level1
        jle level2
        
        level1:
        xchg bl,bh
        
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        mov ah,2
        mov dl,bl
        int 21h
        
        mov ah,2
        mov dl,bh
        int 21h
        
        mov ah,9
        lea dx,msg3
        int 21h
        
        jmp exit
        
        level2:
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        mov ah,2
        mov dl,bl
        int 21h
        
        mov ah,2
        mov dl,bh
        int 21h
        
        mov ah,9
        lea dx,msg3
        int 21h
        
        exit:
        main endp
    end main