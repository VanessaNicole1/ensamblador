;Vanessa Nicole Iniguez Gualan
; 6to A

section .data
        mensaje db "Hola, usando NASM" ; Constante mensaje de 1 byte
        longitud_mensaje equ $-mensaje ; constante que calcula el numero de caracteres de mensaje


section .text
        global _start


_start:

    ; ********** Imprimir el mensaje **********
    mov eax, 4 ; Tipo de subrutina, operacion de escritura, salida
    mov ebx, 1 ; tipo de estandar, por teclado
    mov ecx, mensaje ; El registro ecx almacena la referencia a imprimir de "mensaje"
    mov edx, longitud_mensaje ; El registro edx almacena la referencia a imprimir de "longitud_mensaje"
    int 80H ; Interrupcion de SW para el SO de Linux


    ; ********** Salida **********
    mov eax, 1 ; Salida del programa, system_exit, sys_exit
    mov ebx, 0 ; Si el retorno es 0 es como 200 en la web
    int 80H
