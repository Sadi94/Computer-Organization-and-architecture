.model small
.stack 100h
.data
msg db "insert Hex input: $"
msg2 db 10,13,"$"
msg3 db 10,13,"wrong input $"
.code
main proc
mov ax,@data
mov ds,ax

mov ah,9
lea dx,msg
int 21h

mov bx,0

mov ah,1 ;initialize input / take input
int 21h

cmp al,'A'
je while_

cmp al,'B'
je while_

cmp al,'C'
je while_

cmp al,'D'
je while_

cmp al,'E'
je while_

cmp al,'F'
je while_

cmp al,'0'
je while_

cmp al,'1'
je while_

jmp error

while_:
cmp al,13
je printLineBreak

cmp al,65
jge storeLetter

StoreNumber:
sub al,48
jmp shifting

storeLetter:
sub al,55
jmp shifting

shifting:
shl bx,4
or bl,al

mov ah,1 ; take input again
int 21h

jmp while_

printLineBreak:
mov ah,9
lea dx,msg2
int 21h

print:
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

error:
mov ah,9
lea dx,msg3
int 21h

exit:
main endp
end main