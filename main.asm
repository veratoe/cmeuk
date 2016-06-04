%include "core.mac"
%include "time.asm"
%include "factor.asm"

extern printf

section .data

	s1: db "Factor: %ld", 10, 0
	s2: db "Antwoord: %ld", 10, 0
	s3: db "Loops / 2: %d", 10, 0
	s4: db "Instructies: %d", 10, 0

	fmt: db "%s", 0

section .bss

	instructions: resq 1
	answer: resq 1
	no_loops: resq 1
	le_factor: resq 1

section .text

global _start

_start:
		
	align_stack

	call start_timing
	call factor
	mov [le_factor], rax

	mov rdi, s1
	mov rsi, rax
	mov rax, 1
	call printf 

	mov rcx, 0
	mov rax, [le_factor]
_first_loop:
	inc rcx
	mov rdx, 0
	mov rbx, 2
	div rbx
	cmp rdx, 0
	jz _first_loop
	mov [no_loops], rcx
	mov [answer], rax
	call stop_timing
	mov [instructions], rax

	mov rdi, s2
	mov rsi, [answer]
	mov rax, 1
	call printf

	mov rdi, s3
	mov rsi, [no_loops]
	mov rax, 1
	call printf
	
	mov rdi, s4
	mov rsi, [instructions]
	mov rax, 1
	call printf

	; exit
	mov rax, 60
	mov rdi, 0
	syscall
