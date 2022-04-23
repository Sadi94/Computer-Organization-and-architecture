.model small
.stack 100h
.data
msg db "enter binary number: $"
msg2 db 10,13,"odd $"
msg3 db 10,13,"even $"
var db ?
var2 dw ?



.code
main proc
mov ax,@data
mov ds,ax

mov var2,0

mov ah,9
lea dx,msg
int 21h

mov bx,0 ;clearing register

while:
mov ah,1
int 21h
mov var,al

cmp var,13
je print

cmp var,'0'
je store


cmp var,'1'

je incVar2

jmp exit

store:
shl bx,1
and var,0Fh
or bl,var

;inc var2

jmp while
incVar2:
inc var2
jmp store
;incVar2:
;inc var2

print:

mov ax,var2
;mov dl,var2
mov bl,2
div bl

;mov al,ah
cmp ah,0
jg odd

even:
mov ah,9
lea dx,msg3
int 21h
jmp exit

odd:
mov ah,9
lea dx,msg2
int 21h
jmp exit

exit:
main endp
end main