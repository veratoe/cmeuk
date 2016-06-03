section .data

	s1: db "Het kostte: "
	s1_len: equ $-s1

	s2: db "Wub le float %f\n"
	s3: db "Wubdaufbad", 0

	float1: dq 0.234029

	fmt: db "le float: %f", 10

section .bss


section .text

extern printf

global _start

_start:

	
	mov rdi, fmt
	movq xmm0, [float1]
	mov rax, 1
	call printf

	; exit
	mov rax, 60
	mov rdi, 0
	syscall
