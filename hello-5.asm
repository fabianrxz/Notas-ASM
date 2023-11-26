section .data
    msg db "Mensaje de prueba",0x0a,0x0d,0x00
    len_msg equ $-msg

    msh db "Mensaje de error",0x0a,0x0d,0x00


section .text
    global _start

_start:

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len_msg
    int 0x80

    mov eax, 1
    int 0x80