section .data
    msgerror db "se produjo un error", 0xA, 0xD
    lenerror equ $-msgerror

    msgexito db "archivo creado con exito", 0xA, 0xD
    lenexito equ $-msgexito

    ruta_archivo db "./probando.txt", 0

section .bss
    id_archivo resd 1

section .text
    global _start

_start:
    mov eax, 8
    mov ebx, ruta_archivo
    mov ecx, 640q
    int 0x80

    cmp eax, 0
    jl error

    mov dword[id_archivo], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, msgexito
    mov edx, lenexito
    int 0x80

    mov eax, 6
    mov ebx, [id_archivo]
    int 0x80

    jmp salir

    error:
        mov eax, 4
        mov ebx, 1
        mov ecx, msgerror
        mov edx, lenerror
        int 0x80
    
    salir:
        mov eax, 1
        mov ebx, 0
        int 0x80