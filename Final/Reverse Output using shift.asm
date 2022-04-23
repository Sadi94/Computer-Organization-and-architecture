.model small
.stack 100h
.data
.code
main proc

mov al,10001111b
mov bl,0
mov cx,8

makeReverse:
shl al,1
rcr bl,1
loop makeReverse

mov dl,bl ;transfer reverse value to dl from bl after exit from loop



exit:
main endp
end main