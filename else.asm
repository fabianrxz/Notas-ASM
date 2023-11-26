section .bss
    resultado resb 1

section .text
    global _start

_start:
    mov eax, 6
    mov ebx, 9

    cmp eax, 5
    jz cuerpo_if
    else:
        mov ebx, 0
        jmp salir

    cuerpo_if:
        mov ebx, 1
    
    salir:
        add ebx, 48
        mov [resultado], ebx

        mov eax, 4
        mov ebx, 1
        mov ecx, resultado
        mov edx, 1
        int 0x80

        mov eax, 1
        mov ebx, 0
        int 0x80