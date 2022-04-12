name "EX-02"
org 100h
jmp start

msg1: db "Hello, World!", 0Dh,0Ah, 24h
msg2: db "bye, World!",   0Dh,0Ah, 24h
key db 5h

start: mov  dx, msg1
       mov  ah, 09h
       int 21h
       dec key
  
cmp key, 00h
je close 
cmp key, 00
jne start

close: mov  dx, msg2
       mov  ah, 09h
       int  21h
       
ret