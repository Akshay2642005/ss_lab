;; ADDITION OF TWO 16-BIT NUMBERS
mov si,3000
mov di,4000
mov ax,[si]
inc si
inc si
mov bx,[si]
add ax,bx
jnc 2015
mov [di],0001
jmp 2018
mov [di],0000
inc di
mov [di],ax
hlt

;; SUBTRACTION OF TWO 16-BIT NUMBERS

mov si,3000
mov di,4000
mov ax,[si]
inc si
inc si
mov bx,[si]
cmp ax,bx
jc 2017
sub ax,bx
mov [di],0000
jmp 2022
mov cx,ax
mov ax,bx
mov bx,cx
sub ax,bx
mov [di],0001
inc di
mov [di],ax
hlt
