.model small
.stack 100h
.data
msg db "insert binary input: $"
msg2 db 10,13,"$"
msg3 db 10,13,"wrong input $"
.code
main proc
mov ax,@data
mov ds,ax

mov ah,9
lea dx,msg
int 21h

mov cx,16 ;initialize cx=16 for printing binary value

;taking input from here
mov bx,0

mov ah,1 ;initialize input / take input
int 21h

cmp al,'1'
je while_
cmp al,'0'
je while_

jmp error

while_:
cmp al,0Dh
je printLineBreak

sub al,30h ;converting to binary value
shl bx,1 ;left shift bx
or bl,al ;storing in lsb of bx

mov ah,1 ;take input again
int 21h

jmp while_

printLineBreak:
mov ah,9
lea dx,msg2
int 21h

printBinaryValue: ; take printBinaryValue as for loop
ROL bx,1
jc print1 ;if CF=1 then print 1

print0: ;else print 0
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
loop printBinaryValue
jmp exit

error:
mov ah,9
lea dx,msg3
int 21h


exit:
main endp
end main