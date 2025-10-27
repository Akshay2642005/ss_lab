assume ds:data,cs:code
data segment
  msg db,0ah,0dh,"Enter the first Number:$"
  msg2 db,0ah,0dh,"Enter the second Number:$"
  msg3 db,0ah,0dh,"The difference is : $"
  msg4 db,0ah,0dh,"The difference is negative:$"
data ends

code segment
start:
mov ax,data
mov ds,ax

lea dx,msg
mov ah,09h
int 21h

;input first number
mov ah,01h
int 21h
sub bh,al

mov ah,01h
int 21h
sub bl,al

;input second number
lea dx,msg2
mov ah,09h
int 21h

mov ah,01h
int 21h
mov ch,al

mov ah,01h
int 21h
mov cl,al

;calculate difference

cmp cx,bx
jz ZERO
JNC negative
clc

mov al,bl
mov ah,00h
sub al,cl
aaa
mov cl,ah
add al,30h
mov bl,ah

mov ah,00h
sub bh,ch
mov al,bh
aas

add al,cl
add al,30h

mov bh,al
jmp DISPLAY
ZERO:
  lea dx,msg3
  mov ah,09h
  int 21h
  mov dl,'0'
  mov ah,02h
  int 21h
  mov dl,'0'
  mov ah,02h
  int 21h
  jmp FULL
NEGATIVE:
  lea dx,msg4
  mov ah,09h
  int 21h
  mov dl,'-'
  mov ah,02h
  int 21h

  mov al,cl
  mov ah,00h
  sub al,bl
  aaa
  mov bl,ah
  add al,30h
  mov bh,ah

  mov ah,00h
  sub ch,bh
  mov al,ch
  aas

  add al,bl
  add al,30h

  mov bh,al
DISPLAY:
  lea dx,msg3
  mov ah,09h
  int 21h
  mov dl,bh
  mov ah,02h
  int 21h
  mov dl,bl
  mov ah,02h
  int 21h
FULL:
  mov ah,4ch
  int 21
code ends
end start
