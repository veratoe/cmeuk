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

	mov rax, 1

main_loop:
	mov rcx, rax
	call is_factorable
	cmp rax, 0		
	jne done
	mov rax, rcx
	inc rax
	jmp main_loop

done:
	mov rdi, s2
	mov rsi, rax
	mov rax, 1
	call printf 
	
	call stop_timing
	mov [instructions], rax

	mov rdi, s4
	mov rsi, [instructions]
	mov rax, 1
	call printf

	; exit
	mov rax, 60
	mov rdi, 0
	syscall
