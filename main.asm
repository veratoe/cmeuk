%include "core.mac"
%include "factors.asm"

extern printf

section .data

	s1: db "Array: ", 0
	s2: db "%lld ", 0
	s3: db "Factoren in 24: %lld ", 0

	newline: db 10, 0

section .bss

	factor_array: resb 1
	le_factors: resq 1
	n: resq 1

section .text

global _start

_start:
		
	align_stack

; vul de array
	mov rax, 1
	mov rdi, factor_array

fill_array:

	mov [rdi + rax - 1], ax
	inc rax
	cmp rax, 20
	jbe fill_array

; print de array		
	mov rdi, s1
	mov rax, 0
	call printf

	mov rbx, 0


print_array:
	mov rdi, s2
	mov rcx, 0
	mov cl, byte [factor_array + rbx]
	mov rsi, rcx
	mov rax, 1
	call printf
	inc rbx
	cmp rbx, 20
	jne print_array


	mov rax, 24
	mov rdi, le_factors
	call prime_factors
	mov [n], rcx

	mov rdi, newline
	mov rsi, 0
	call printf

	mov rdi, s3
	mov rsi, [n]
	mov rax, 1
	call printf

	mov rbx, 0

print_factoren:
	mov rdi, s2
	mov rsi, [le_factors + rbx * 8]
	mov rax, 1
	call printf
	
	inc rbx	
	mov rax, rbx
	inc rax
	cmp rax, [n]  
	jne print_factoren

	mov rdi, newline
	mov rsi, 0
	call printf

; exit
	mov rax, 60
	mov rdi, 0
	syscall
