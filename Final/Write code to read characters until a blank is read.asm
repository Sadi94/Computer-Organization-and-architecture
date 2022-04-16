;Write code to read characters until a blank is read

.model small
.stack 100h
.data
msg db "enter a characters: $"
var db ?
.code
    main proc
       
       mov ah,1
       
       do_while:
       int 21h
       mov var,al
       
       cmp var," "
       jne do_while
        
        
       exit:
       main endp
    end main