section .data

section .bss
	Wub: resb 4	

section .text

global _start

PrintChar:
	push rax
	push rbx
	push rdx
	
	mov rax, 4
	mov rbx, 1
	mov rcx, 53 
	mov rdx, 4
	int 0x80

	pop rdx
	pop rbx
	pop rax
	ret	

_start:
	mov rcx, 3
	mov rsi, 3
	mov rdi, 5

	xor rbx, rbx



_loop:
	mov rax, rcx
	xor rdx, rdx
	div rsi
	test rdx, rdx
	je _yes
	
	mov rax, rcx
	xor rdx, rdx
	div rdi
	test rdx, rdx
	jne _no

_yes:
	add rbx, rcx

_no inc rcx
	cmp rcx, 1000
	jne _loop

	mov DWORD [Wub], 354
	call PrintChar

	mov rax, 1
	mov rbx, 0
	int 0x80
