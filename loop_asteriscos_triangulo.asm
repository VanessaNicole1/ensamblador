; Vanessa Nicole Iniguez Gualan
; Sexto A
; Fecha: Miercoles, 29 de Julio del 2020
section .data
    asterisco db "*" 
    len_asterisco equ $-asterisco
    new_line db 10, ''

section .text
    global _start

_start:
    mov ecx, 10 ; Las veces que deseo imprimir con el loop
   

for1: 
    push ecx  
    call enter ; utilice call para llamar a la etiqueta enter
    pop ebx
    mov ecx, ebx
    push ebx 


for2:
    push ecx  
    call mostrar_asterisco ; utilice call para llamar a la etiqueta mostrar_asterisco
    pop ecx
    loop for2
    
    pop ecx
    pop ebx 
    loop for1

    mov eax, 1 
    int 80h

mostrar_asterisco: ; etiqueta que sirve para imprimir el asterisco
    mov eax, 4
    mov ebx, 1
    mov ecx, asterisco
    mov edx, 1
    int 80h
    ret ; siempre que se utilice un call se debe poner el ret

enter: ; etiqueta que sirve para imprimir el enter
    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, 1
    int 80h
    ret 