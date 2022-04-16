;summation of 20+15+10+5 

.model small
.stack 100h
.data
.code
    main proc
        
        mov cx,3
        
        mov al,20;first number
        mov bl,5 ;difference between two number
        mov bh,0 ;initialize bh as sum
        
        
        add bh,al
        do_while:
        
        sub al,5
        add bh,al
        dec cx
        cmp cx,0
        je exit
        jmp do_while
        
        exit:
        main endp
    end main