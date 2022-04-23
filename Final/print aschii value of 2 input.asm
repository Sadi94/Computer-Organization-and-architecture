;printing in ascii order
.model small
.stack 100h
.data
msg db "enter first character: $"
msg2 db 10,13,"enter second character: $"
msg3 db 10,13,"ASCII Order: $"
.code
main proc
mov ax,@data
mov ds,ax

mov ah,9
lea dx,msg
int 21h

mov ah,1
int 21h
mov bl,al

mov ah,9
lea dx,msg2
int 21h

mov ah,1
int 21h
mov bh,al

cmp bl,bh
jg exchange
jmp print

exchange:
xchg bl,bh

jmp print

print:
mov ah,9
lea dx,msg3
int 21h

mov ah,2
mov dl,bl
int 21h

mov dl,bh
int 21h

exit:
main endp
end main