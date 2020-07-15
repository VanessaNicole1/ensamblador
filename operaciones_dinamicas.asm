; Vanessa Nicole Iñiguez Gualan
; 6to A
; ********** MACROS **********
; ********** MACRO PARA IMPRIMIR **********
%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

; ********** MACRO PARA LEER **********
%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
        mensaje_numero db "Ingrese el numero:", 10
        len_mensaje_numero equ $-mensaje_numero

        mensaje_suma db "La suma es igual a: "
        len_mensaje_suma equ $-mensaje_suma

        mensaje_resta db "La resta es igual a: "
        len_mensaje_resta equ $-mensaje_resta

        mensaje_multiplicacion db "La multiplicacion es igual a: "
        len_mensaje_multiplicacion equ $-mensaje_multiplicacion

        mensaje_cociente db "El cociente es igual a: "
        len_cociente equ $-mensaje_cociente

        mensaje_residuo db "El residuo es igual a: "
        len_residuo equ $-mensaje_residuo

        new_line db "",10
        len_new_line equ $-new_line

section .bss
        numero1 resb 1
        numero2 resb 1
        suma resb 1
        resta resb 1
        multiplicacion resb 1
        cociente resb 1
        residuo resb 1

section .text
        global _start

_start:

; **************** Lectura ****************

        imprimir mensaje_numero, len_mensaje_numero
        leer numero1, 2
        imprimir mensaje_numero, len_mensaje_numero
        leer numero2, 2

    
; **************** SUMA ****************

        mov eax, numero1
        mov ebx, numero2
        add eax, ebx
        add eax, '0'
        mov [suma], eax


; **************** RESTA ****************
        mov eax, numero1
        mov ebx, numero2
        sub eax, ebx
        add eax, '0'
        mov [resta], eax

    
; **************** MULTIPLICACION ****************

        mov eax, numero1
        mov ebx, 2
        mul ebx
        add eax, '0'
        mov [multiplicacion], eax


; **************** DIVISION ****************

        mov al, numero1
        mov bh, numero2
        div bh
        sub al, '0'
        add ah, '0'
        mov [cociente], al
        mov [residuo], ah

; **************** IMPRIMIR MENSAJE SUMA ****************
    imprimir mensaje_suma, len_mensaje_suma

; **************** IMPRIMIR RESULTADO SUMA ****************
    imprimir suma, 1


; **************** IMPRIMIR LINEA EN BLANCO ****************
    imprimir new_line, len_new_line

; **************** IMPRIMIR MENSAJE RESTA ****************
    imprimir mensaje_resta, len_mensaje_resta

; **************** IMPRIMIR RESULTADO RESTA ****************
    imprimir resta, 1


; **************** IMPRIMIR LINEA EN BLANCO ****************
    imprimir new_line, len_new_line

; **************** IMPRIMIR MENSAJE MULTIPLICACION ****************
    imprimir mensaje_multiplicacion, len_mensaje_multiplicacion

; **************** IMPRIMIR RESULTADO MULTIPLICACION ****************
    imprimir multiplicacion, 1


; **************** IMPRIMIR LINEA EN BLANCO ****************
    imprimir new_line, len_new_line

; **************** DIVISION ****************

; **************** IMPRIMIR MENSAJE COCIENTE ****************
    imprimir mensaje_cociente, len_cociente

; **************** IMPRIMIR RESULTADO COCIENTE ****************
    imprimir cociente, 1


; **************** IMPRIMIR MENSAJE RESIDUO ****************
    imprimir mensaje_residuo, len_residuo

; **************** IMPRIMIR RESULTADO RESIDUO ****************
    imprimir residuo, 1

; **************** IMPRIMIR LINEA EN BLANCO ****************
    imprimir new_line, len_new_line


; **************** SALIR ****************

    mov eax, 1
    int 80H








    




