section .data
    msg1 db "es par", 0xA, 0xD
    lonmsg1 equ $-msg1

    msg2 db "es impar", 0xA, 0xD
    lonmsg2 equ $-msg2

section .text
    global _start

_start:
    mov al, 8
    mov bl, 1

    and al, bl
    jz es_par

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, lonmsg2
    int 0x80

    jmp _salir

es_par:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, lonmsg1
    int 0x80

_salir:
    mov eax, 1
    mov ebx, 0
    int 0x80
