section .data
    msg db 0xA, 0xD, "No es posible dividir entre cero", 0xA, 0xD
    lonmsg equ $-msg

section .bss
    resultado resb 1

section .text
    global _start

_start:
    mov eax, 4
    mov edx, 0
    mov ebx, 2

    cmp ebx, 0
    je es_cero

    div ebx
    add ebx, 48
    mov [resultado], ebx
    
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    jmp salir

es_cero:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, lonmsg
    int 0x80

salir:
    mov eax, 1
    mov ebx, 0
    int 0x80