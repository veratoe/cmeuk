%include "core.mac"

extern printf

section .data
	s1: db "Priemgetal %d: %d", 10, 0
	s2: db "Sqrt %d: %d", 10, 0

section .bss

	n: resq 1 
	count: resq 1
	sqrt: resq 1

section .text

global _start


_square_root:
	push rax
	mov qword [count], 1	
	mov rcx, 0

_square_root_loop:
	sub rax, [count]
	inc qword [count]
	inc qword [count]
	cmp rax, 0
	js _square_root_done
	inc rcx
	jnz _square_root_loop

_square_root_done:
	pop rax
;	mov rdi, s2;
;	mov rsi, rax
;	mov rdx, rcx
;	push rax
;	mov rax, 0
;	call printf
;	pop rax
	ret

_start:

	mov rax, 1

_next_n:

	inc rax
	call _square_root
	inc rcx
	mov [sqrt], rcx
	mov rcx, 2

_test:

_loop:
	push rax
	mov rdx, 0
	div rcx
	pop rax
	cmp rdx, 0
	jz _has_factor
	inc rcx
	cmp rcx, sqrt 
	jb _test

_has_factor:
	cmp rcx, rax
	jne _next_n

	inc qword [n]

	push rax
	pop rax

	cmp qword [n], 10001
	jb _next_n

_done:

	mov rdi, s1
	mov rsi, [n]
	mov rdx, rax
	mov rax, 0
	call printf
	quit
