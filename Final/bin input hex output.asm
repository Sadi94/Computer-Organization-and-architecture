
;binary input hex output
.model small
.stack 100h
.data
msg db "enter binary num: $"
msg2 db 10,13,"$"
.code
main proc
mov ax,@data
mov ds,ax
mov ah,9
lea dx,msg
int 21h
mov bx,0
mov ah,1
int 21h
while_:
cmp al,13
je print
sub al,48
shl bx,1
or bl,al
mov ah,1
int 21h
jmp while_
print:
mov ah,9
lea dx,msg2
int 21h
mov cx,4
top:
mov dl,bh
shr dl,4
shl bx,4
cmp dl,10
jge printLetter
printNumber:
add dl,48
mov ah,2
mov dl,dl
int 21h
jmp goBackTop
printLetter:
add dl,55
mov ah,2
mov dl,dl
int 21h
jmp goBackTop
goBackTop:
loop top
jmp exit
exit:
main endp
end main

