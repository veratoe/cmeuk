
global Print_number
global Print_ln_break

Print_number:		; print de waarde in rax naar stdout

	mov r8, rsp		; d'n stack pointer bewaren
	mov rcx, 0
	mov rbx, 10

loop:
	mov rdx, 0
	div rbx			; deel rax door 10	
	add rdx, 48		; ASCII ervan maken door 48 by op te tellen
	shl dx, 8
	push dx 
	inc rsp
	inc rcx	
	cmp rax, 0
	jnz loop		

	; de boel printen	
	mov rax, 1
	mov rdi, 1
	mov rdx, rcx 	; eerst rcx naar rdx voor we iets nieuws in rcx stoppen
	mov rsi, rsp
	syscall
	
	mov rsp, r8
	ret

Print_ln_break:

	mov r8, rsp
	mov dh, 10
	mov dl, 0
	push dx
	inc rsp

	mov rax, 1		; sys_write 
	mov rdi, 1		; naar stdout
	mov rdx, 1
	mov rsi, rsp
	syscall

	mov rsp, r8
	ret
	
