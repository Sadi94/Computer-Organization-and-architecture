.model small
.stack 100h
.data
msg db "enter hex number: $"
.code
main proc
mov ax,@data
mov ds,ax

mov ah,9
lea dx,msg
int 21h

mov bx,0
mov cl,4

mov ah,1
int 21h

while:
cmp al,13
je print
cmp al,65
jge letter

and al,0Fh ;converting to ascii didit to number
jmp shift

letter:
sub al,55

shift:
shl bx,cl
or bl,al
int 21h

jmp while

print:
mov cx,0 ;clearing register

mov cl,16

top:
jcxz exit
shl bx,1
jc print_1

print_0:
mov ah,2
mov dl,'0'
int 21h
loop top

print_1:
mov ah,2
mov dl,'1'
int 21h
loop top

exit:
main endp
end main