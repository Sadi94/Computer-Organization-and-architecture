.model small
.stack 100h
.data
msg db "enter your number: $"
msg2 db 10,13,"even $"
msg3 db 10,13,"odd $"
msg4 db 10,13,"wrong input $"
.code
main proc
mov ax,data
mov ds,ax

mov ah,9
lea dx,msg
int 21h

mov ah,1
int 21h

cmp al,'9'
jg error
jmp level1

level1:
cmp al,'0'
jl error

test al,01h

;cmp al,0
jz even
jmp odd

even:
mov ah,9
lea dx,msg2
int 21h

jmp exit

odd:
mov ah,9
lea dx,msg3
int 21h

jmp exit

error:
mov ah,9
lea dx,msg4
int 21h

exit:
main endp
end main