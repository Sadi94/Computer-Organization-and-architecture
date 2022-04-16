;Write an assembly probram to print all the ASCII code from 0 to 255.  
;Hints: use jnz and dec instructions

.model small
.stack 100h
.data
.code
main proc
    mov cl,255
    mov ch,0
    
    level1:
    mov ah,2
    mov dl,ch
    int 21h
    
    inc ch
    
    cmp cl,0
    dec cl
    jnz level1
    jmp exit
    
    exit:
    main endp
end main