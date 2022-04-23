;counting 0
.model small
.stack 100h
.data
.code
main proc
mov ax,10111110b
mov cx,8
mov dx,0



top:

ROR ax,1
jc goBackTop
inc dx
loop top

goBackTop:
loop top

exit:
main endp
end main