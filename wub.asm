
section .text

	global _start

_start:
	mov rax, 4
	mov rbx, 1
	mov rcx, EatMsg
	mov rdx, EatLen
	int 80H

	mov rax, 1
	mov rbx, 0
	int 80H

	
section .data
	EatMsg:  db "(c) 2016 Mansie daFLIP", 10
	EatLen: equ $-EatMsg
