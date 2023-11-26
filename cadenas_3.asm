%macro imprime 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

section .data
    string1 db 'string de prueba'
    len1 equ $-string1

    ln db 0xA, 0xD
    lenln equ $-ln

    encon db 'letra encontrada'
    lenenc equ $-encon

    noencon db 'letra no encontrada'
    lennoe equ $-noencon

section .text
    global _start

_start:
    cld

    mov ecx, len1
    mov edi, string1
    mov al, 'z'

    repne scasb
    je si_se_encuentra
    imprime noencon, lennoe
    imprime ln, lenln

    jmp salir

    si_se_encuentra:
        imprime encon, lenenc
        imprime ln, lenln
         
    salir:
    mov eax, 1
    mov ebx, 0
    int 0x80