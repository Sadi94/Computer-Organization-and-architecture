.model small
.stack 100h
.data
msg db "enter your string: $"
msg2 db 10,13,"Reverse: $"
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg
    int 21h
    
    mov cx,0 ;initialize counter
    mov ah,1 ;initialize input
    
    while:
    int 21h
    
    cmp al,0Dh
    je printMsg
    
    cmp al,'0'
    je go
    cmp al,'1'
    je go
    jmp exit
    go:
    push ax
    inc  cx
    jmp while
    
    printMsg:
    mov ah,9
    lea dx,msg2
    int 21h
    
    print:
    
    cmp cx,0
    je exit
    
    ;add ax,48
    mov ah,2
    pop dx
    int 21h
    dec cx
    jmp print
    
    exit:
    main endp
end main
