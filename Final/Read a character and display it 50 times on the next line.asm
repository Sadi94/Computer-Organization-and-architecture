;Read a character and display it 50 times on the next line. 
;Hints: use LOOP instructions and put cx = 50

.model small
.stack 100h
.data
msg db "Enter a character: $"
msg2 db 10,13,"Thank You $"
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
        
        mov ah,2 ;new line
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        
        mov cx,50
        top:
        mov ah,2
        mov dl,var
        int 21h
        loop top
        
        mov ah,2  ;new line
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        mov ah,9
        lea dx,msg2
        int 21h
        
        exit:
        main endp
    end main
    