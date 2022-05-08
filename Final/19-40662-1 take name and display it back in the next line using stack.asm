.model small
.stack 100h
.data        

msg db "Enter your name: $"
msg2 db 10,13,"$" 

.code
main proc
    mov ax,data
    mov ds,ax
    
    mov ah,9
    lea dx,msg
    int 21h
    
    mov ah,1
    mov cx,0
    
    take:
    int 21h
    
    cmp al,13
    je newLine
    
    push ax
    inc cx
    jmp take
    
    newLine:
    mov ah,9
    lea dx,msg2
    int 21h
    
    display:
    cmp cx,0
    je exit
    
    pop ax
    
    mov ah,2
    mov dx,ax
    int 21h
    
    dec cx
    
    jmp display

exit:
main endp
end main