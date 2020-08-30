; Vanessa Nicole Iñiguez Gualan
; 2020 - 19 - Agosto

section .data
        msj1 db  "Ingrese 5 numeros: ", 10
        len1 equ $ - msj1
        msj_mayor db  "El menor es: ", 10
        len_mayor equ $ - msj_mayor

        arreglo db 0, 0, 0, 0, 0
        len_arreglo equ $ - arreglo

section .bss
        numero resb 2

section .text
        global _start

_start:
        mov esi, arreglo
        mov edi, 0


        mov eax, 4
        mov ebx, 1
        mov ecx, msj1
        mov edx, len1
        int 80h

; ******** lectura de datos en el arreglo *********

leer:
        
        mov eax, 3
        mov ebx, 2
        mov ecx, numero
        mov edx, 2
        int 80h

        mov al, [numero]
        sub al, '0'

        mov [esi], al

        inc edi         
        inc esi

        cmp edi, len_arreglo
        jb leer

        mov ecx, 0
        mov bl, [arreglo + ecx]

comparacion:
        mov al, [arreglo + ecx]
        cmp al, bl
        jg contador
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
        mov ecx, msj_mayor
        mov edx, len_mayor
        int 80h
        

        mov eax, 4
        mov ebx, 1
        mov ecx, numero
        mov edx, 1
        int 80h


salir:
        mov eax, 1
        int 80h