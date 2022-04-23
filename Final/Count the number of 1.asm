.model small
.stack 100h
.data
.code
main proc
mov ax,11111111b
mov cx,8
mov dx,0

top:

ROR ax,1
jc count
loop top

count:
inc dx
loop top

exit:
main endp
end main