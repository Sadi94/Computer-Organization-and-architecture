;summation of 20+15+10+5 

.model small
.stack 100h
.data
.code
    main proc
        
        mov cx,20
        
        mov bx,100;first number
        ;mov bl,5 ;difference between two number
        mov ax,0 ;initialize bh as sum
        
        top:
        add ax,bx
        sub bx,5
        loop top
        
        exit:
        main endp
    end main
        
        
        
        
        
        
        
        
    
