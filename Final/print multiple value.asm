;printing multiple digit

mov ax,625
mov cx,0
mov dx,0

check:
cmp ax,0
je print
mov bx,10
div bx
push dx
inc cx
mov dx,0
jmp check

print:
cmp cx,0
je exit
pop dx
add dx,48
mov ah,2
mov dx,dx
int 21h
dec cx
jmp print

exit:
ret