;Take an input character from user. 
;Check it for letter and 
;convert upper to lower or lower to upper 
;using logical instructions.

.model small
.stack 100h
.data
msg db "enter a character: $"
msg2 db 10,13,"not a character $"
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
        
        cmp var,'a'
        jge makeUpper
        
        cmp var,'Z'
        jle makeLower
        jmp exit
        
        makeUpper:
        cmp var,'z'
        jg notChar
        
        and var,0DFh
        
        mov ah,2
        mov dl,var
        int 21h
        
        jmp exit
        
        makeLower:
        cmp var,'A'
        jl notChar
        
        or var,20h
        
        mov ah,2
        mov dl,var
        int 21h
        
        jmp exit
        
        notChar:
        mov ah,9
        lea dx,msg2
        int 21h
        
        exit:
        main endp
    end main