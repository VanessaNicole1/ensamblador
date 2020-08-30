; Vanessa Nicole Iniguez Gualan
; Sexto A
; Fecha: Miercoles, 29 de Julio del 2020
section .data
    asteriscos db "*********" , 10
    len_asteriscos equ $-asteriscos


section .text
    global _start

_start:
    mov ecx, 5 ; Variable que voy a utilizar para recorrer
for1: ;.
    mov eax, 4
    mov ebx, 1
    push ecx  ; envio el valor de ecx a pila
    mov ecx, asteriscos
    mov edx, len_asteriscos
    int 80h
    pop ecx ; obtengo el valor que se encuentra en la pila
    loop for1 ; decrementa ecx en 1
salir: ; etiqueta para salir del programa
    mov eax, 1
    int 80h