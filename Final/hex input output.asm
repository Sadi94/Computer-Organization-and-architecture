;hex input output
.model small
.stack 100h
.data
msg db "enter hex number: $"
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        lea dx,msg
        int 21h
        
        mov bx,0                
        mov cl,4
        
        mov ah,1
        int 21h
        
        while:
            cmp al,13
            je print
            cmp al,65
            jge letter
            
            and al,0Fh ;converting to ascii digit to number
            jmp shift
            
            letter:
            sub al,55
            
            shift:
            shl bx,cl
            or bl,al
            int 21h
            
            jmp while
            
            print:
            mov cx,4
            
            mov ah,2
            
            for:
            mov dl,bh
            shr dl,4
            
            shl bx,4
            
            cmp dl,10
            jge printLetter
            
            add dl,48  ;printing digit
            int 21h
            
            jmp endFor
                     
            printLetter:
            add dl,55
            int 21h
            
            jmp endFor
            
            endFor:
            loop for
            
            exit:
            main endp
    end main