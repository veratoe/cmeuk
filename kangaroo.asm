section .data
	Snip db "KANGAROO "
section .text

global _start

_start:
			mov rbx, Snip
			mov rax, 8

DoMore:		add word [rbx], 32
			inc rbx
			dec rax
			jnz DoMore

			mov rax, 4
			mov rbx, 1
			mov rcx, Snip
			mov rdx, 8
			int 80h

			mov rax, 1
			mov rbx, 0
			int 80H	
