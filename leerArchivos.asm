; Vanessa Nicole Iniguez G


%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

segment .data
    msj1 db "Leer el archivo:",10
    len_msj1 equ $ - msj1
    direccion_archivo db "/home/vane/Ensamblador/archivo.txt"


segment .bss
    texto resb 30
    idarchivo resd 1 

segment .text
    global _start

_start:
    ;***************Abrir archivo
    mov eax,5
    mov ebx, direccion_archivo
    mov ecx, 0
    mov edx, 777h
    int 80h

    test eax,eax
    jz salir

    mov dword [idarchivo], eax

    escribir msj1, len_msj1

    ;***************Leer archivo
    mov eax,3
    mov ebx,[idarchivo]
    mov ecx, texto
    mov edx, 15
    int 80h

    escribir texto, 15
    
    ;***************Cerrar archivo
    mov eax,6 ;close
    mov ebx, [idarchivo]
    mov ecx, 0
    mov edx, 0
    int 80h

salir: 
    mov eax, 1
    int 80h 
 
