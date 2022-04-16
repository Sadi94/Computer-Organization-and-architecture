;summation of 1+5+9+13 

.model small
.stack 100h
.data
.code
    main proc
        
        mov cx,3
        
        mov al,1;first number
        mov bl,4 ;difference between two number
        mov bh,0 ;initialize bh as sum
        
        
        add bh,al
        do_while:
        
        add al,bl
        add bh,al
        dec cx
        cmp cx,0
        je exit
        jmp do_while
        
        exit:
        main endp
    end main