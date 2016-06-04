section .text

; ===	factor

factor:

	mov rax, 1
	mov rbx, 1

le_loop:
	cmp rbx, 20
	je le_end
	mov rcx, rax
	mov rdx, 0
	inc rbx	
	div rbx
	cmp rdx, 0
	jz is_factor

	mov rax, rcx
	mul rbx	
	jmp le_loop

is_factor:
	mov rax, rcx
	jmp le_loop		

le_end:
	ret

; ===	is_factorable

is_factorable:
	
	mov rbx, 20
	
is_factorable_loop:

	mov rcx, rax
	mov rdx, 0
	div rbx
	cmp rdx, 0
	jnz not_factorable
	dec rbx
	cmp rbx, 0
	jnz is_factorable_loop
	mov rax, 1
	ret
	
	jmp is_factorable

not_factorable: 

	mov rax, 0
	ret
