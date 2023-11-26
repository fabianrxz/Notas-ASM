%macro imprime 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

section .data
    string1 db 'HOLA MUNDO'
    len1 equ $-string1

    ln db 0xA, 0xD
    lenln equ $-ln

    string2 db 'String 2  '
    len2 equ $-string2

section .text
    global _start

_start:
    cld

    mov ecx, len1
    mov esi, string1
    mov edi, string2

    rep movsb

    imprime string2, len1
    imprime ln, lenln

    mov eax, 1
    mov ebx, 0
    int 0x80