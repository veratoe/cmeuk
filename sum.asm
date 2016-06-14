%include "core.mac"

extern printf

section .data
	s1: db "Som n: %u", 10, 0
	s2: db "Som kwadraat n: %u", 10, 0

section .bss

	sum: resq 1 
	sum_squares: resq 1 

section .text

global _start

_start:

	mov rcx, 1
	mov qword [sum], 0
	mov qword [sum_squares], 0
_loop:
	add [sum], rcx
	mov rax, rcx
	mul rcx
	add [sum_squares], rax
	inc rcx
	cmp rcx, 100
	jbe _loop

	mov rdi, s1
	mov rsi, [sum]		
	mov rax, 0
	call printf

	mov rdi, s2
	mov rsi, [sum_squares]
	mov rax, 0
	call printf

_done:

	quit
