section .data
msgerror db "se produjo un error",0xa,0xd
lon equ $-msgerror

msgexito db "archivo abierto con exito",0xa,0xd
lonexito equ $-msgexito

archivo db "./prueba.txt",0

section .bss
idarchivo resd 1
contenido resb 16384

section .text
global _start
_start:

mov eax, 5
mov ebx, archivo
mov ecx, 0002h
int 0x80

cmp eax, 0
jl error

mov dword[idarchivo], eax

mov eax, 4
mov ebx,1
mov ecx, msgexito
mov edx, lonexito
int 0x80

mov eax, 3
mov ebx, [idarchivo]
mov ecx, contenido
mov edx, 16384
int 0x80

mov eax, 4
mov ebx, 1
mov ecx, contenido
mov edx, 16384
int 0x80

mov eax, 6
mov ebx, [idarchivo]
int 0x80

jmp salir

error:
mov eax, 4
mov ebx, 1
mov ecx, msgerror
mov edx, lon
int 0x80

salir:
mov eax,1
mov ebx,0
int 0x80
