;summation of 20+15+10+5 

.model small
.stack 100h
.data
.code
    main proc
        
        mov cx,4
        
        mov al,100;first number
        mov bl,5 ;difference between two number
        mov bh,5 ;initialize bh as sum
        
        top:
        add bh,al
        sub al,5
        loop top
        
        exit:
        main endp
    end main