.model small
.stack 100h
.data
msg db "eneter hex num: $"
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
je printLineBreak

cmp al,65
jge convertLetter

convertNumber:
sub al,48
jmp shifting

convertLetter:
sub al,55
jmp shifting

shifting:
shl bx,4
or bl,al

mov ah,1
int 21h

jmp while_

printLineBreak:
mov ah,9
lea dx,msg2
int 21h

mov cx,16

print:
ROL bx,1
jc print1

print0:
mov ah,2
mov dl,'0'
int 21h

jmp goBack

print1:
mov ah,2
mov dl,'1'
int 21h

jmp goBack

goBack:
loop print


exit:
main endp
end main