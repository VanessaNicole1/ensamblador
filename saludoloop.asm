; Vanessa Nicole Iniguez
section .data
    saludo db "Hola mundo",10
    len_saludo equ $-saludo

section .txt
    global _start

_start:
    mov ecx, 20

for:
    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, saludo
    mov edx, len_saludo
    int 80h
    pop ecx
    
    loop for

salir:
    mov eax, 1
    int 80h 
