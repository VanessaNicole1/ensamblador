; Vanessa Nicole Iniguez
%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %1
    int 0x80
%endmacro

segment .data
    msj1 db "Ingresa datos en el archivo", 10
    len_msj1 equ $-msj1

    archivo db "/home/vane/Ensamblador/archivo.txt"

segment .bss
    texto resb 30
    idarchivo resd 1

segment .text
    global _start

_start:

    mov eax, 8          ; servicio para crear archivos, trabajar con archivos
    mov ebx, archivo    ; direccion del archivo
    mov ecx, 1          ; MODO DE ACCESO
                            ; O-RDONLY: El archivo se abre solo para leer
                            ; O-WRONLY: El archivo se abre para escritura
                            ; O-RDW 2: El archivo se abre para escritura y lectura
                            ; O-CREATE 256: Crea el archivo en caso que no exista
                            ; O-APPEND 2000h: El archivo se abre solo para escritura al final

    mov edx, 777h    
    int 80h

    test eax, eax

    jz salir

    escribir msj1, len_msj1

    mov dword [idarchivo], eax

    call leer

    ; ********** Escritura del archivo
    mov eax, 4
    mov ebx, [idarchivo]
    mov ecx, texto

leer:
    mov eax, 3
    mov ebx, 0
    mov ecx, texto
    mov edx, 10
    int 80H


salir:
    mov eax, 1
    int 80H


