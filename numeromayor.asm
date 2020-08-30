section .data
    msj db "Ingrese 5 numeros", 10
    len1 equ $ - msj

    msj2 db "Numero mayor es: ", 10
    len2 equ $ - msj2

    arreglo db 0, 0, 0, 0, 0
    len_arreglo equ $-arreglo

section .bss

        numero resb 2

section .text
         global _start

_start:

        mov esi, arreglo ; 00000
        mov edi, 0


 ; *******  mensaje 1 **********
        mov eax, 4
        mov ebx, 1
        mov ecx, msj
        mov edx, len1
        int 80H


; ******** lectura de datos en el arreglo *********

leer:
        mov eax, 3
        mov ebx, 0
        mov ecx, numero
        mov edx, 2
        int 80H

        mov al, [numero]
        sub al, '0'

        mov [esi], al ; movemos el valor a un indice del arreglo

        inc edi
        inc esi ; indice del arreglo

        cmp edi, len_arreglo
        jb leer

        mov ecx, 0
        mov bl, 0

comparacion:
        mov al, [arreglo + ecx]
        cmp al, bl
        jb contador ; salta cuando el primer operando es menor que el segundo
        mov bl, al

contador:
        inc ecx
        cmp ecx, len_arreglo
        jb comparacion

imprimir:
        add bl, '0'
        mov [numero], bl


        mov eax, 4
        mov ebx, 1
        mov ecx, msj2
        mov edx, len2
        int 80H

        mov eax, 4
        mov ebx, 1
        mov ecx, numero
        mov edx, 1
        int 80H

salir:
        mov eax, 1
        int 80H






