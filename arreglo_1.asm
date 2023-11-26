%macro imprime 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

section .data
    datos db '45', '23', '11', '09', '78'
    lend equ $-datos

    ln db 0xA, 0xD
    lenln equ $-ln

section .text
    global _start

_start:
    mov ebp, datos
    mov edi, 1

    ciclo:
        imprime ebp, 2
        imprime ln, lenln
        add ebp, 2
        add edi, 2

        cmp edi, lend
        jb ciclo


    imprime datos, 2

    imprime ln, lenln

    imprime datos+4, 2

    imprime ln, lenln

    mov eax, 1
    mov ebx, 0
    int 0x80