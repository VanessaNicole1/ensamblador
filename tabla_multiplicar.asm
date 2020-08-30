;Vanessa Nicole Iniguez
; 2020 - Agosto - 05
; Deber
%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro


section .data
    msj1 db " * "
    len_msj1 equ $-msj1

    msj2 db " = "
    len_msj2 equ $-msj2

    new_line db "",10
    len_new_line equ $-new_line

section .bss    
    a resb 2
    b resb 2
    c resb 2
    num resb 2

section .text
    global _start

_start:
    ;mov al, 1
    ;add al, '0'
    ;mov [a], al


    mov cx, 1 ; iterable 1, 2, 3, 4
    


pila:
  
    push cx
    mov ax, cx
    add ax, '0'
    mov [a], ax
    mov cx, 1
    call ciclo1
    pop cx
    inc cx
    cmp cx, 10
    jnz pila
    mov eax, 1
    int 80h
    


ciclo1:
    push cx
    mov ax, [a]
    sub ax, '0'
    mul cx
    add ax, '0'
    mov [c],ax
    add cx, '0'
    mov [b], cx
    imprimir a, 1
    imprimir msj1, len_msj1
    imprimir b,1
    imprimir msj1, len_msj2
    imprimir c,1    
    imprimir new_line,len_new_line
    pop cx
    inc cx
    cmp cx,10
    jnz ciclo1
    ret


imprimir_numero2:
    mov eax, 4
    mov ebx, 1
    mov ecx, a
    mov edx, 1
    int 80h
    ret

    mov eax,1
    int 80h

imprimir_numero3:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj1
    mov edx, len_msj1
    int 80h
    ret

imprimir_numero4:
    mov eax, 4
    mov ebx, 1
    mov ecx, b
    mov edx, 1
    int 80h
    ret

imprimir_numero5:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj2
    mov edx, len_msj2
    int 80h
    ret

imprimir_numero6:
    mov eax, 4
    mov ebx, 1
    mov ecx, c
    mov edx, 1
    int 80h
    ret

imprimir_numero7:
    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, len_new_line
    int 80h
    ret


salir:

    mov eax,1
    int 80h






