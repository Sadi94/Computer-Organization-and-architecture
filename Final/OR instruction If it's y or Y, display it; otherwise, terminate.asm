;Read a character. If it's "y" or "Y", display it; otherwise, terminate the program

.model small
.stack 100h
.data
msg db "enter a character: $"
var db ?
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
        
        cmp var,'Y'
        je level1
        
        cmp var,'y'
        je level1
        
        jmp exit
        
        level1:
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        mov ah,2
        mov dl,var
        int 21h
        
        
        exit:
        main endp
    end main