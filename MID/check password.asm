.model small
.stack 100h
.data
msg1 db 'Enter your password:$'
msg2 db 10,13,'Correct$'
msg3 db 10,13,'Incorrect$'
msg4 db '201224$'
msg5 dw 6

.code 
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov cx,msg5
    mov bx,offset msg4
    
    l1:
    mov ah,1
    int 21h
    
    cmp al,[bx]
    jne l2
    inc bx
    loop l1
    
    mov ah,9
    lea dx,msg2
    int 21h
    jmp exit
    
    l2:
    mov ah,9
    lea dx,msg3
    int 21h
    jmp exit
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main