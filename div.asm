section .bss
resultado resb 1

section .text
	global _start
_start:

; se asigna este bloque para diidir, donde siempre el dividendo va en ax y el divisor en bx
mov bx, 3

mov dx, 0
mov ax, 9

div bx
; fin del bloque divisor, el resultado alto (enteros) se almacena en ax

add ax, 48

mov [resultado], ax

mov eax, 4
mov ebx, 1
mov ecx, resultado
mov edx, 1
int 0x80

mov eax, 1
mov ebx, 0
int 0x80