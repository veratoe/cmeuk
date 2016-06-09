
extern printf

section .bss

	f: resq 1
	p: resq 1

section .data

	pf_s1: db "We factoreren: %lld", 10, 0
	pf_s2: db "factor gevonden: %lld", 10, 0


section .text

; ===	primefactoren

; params:

; 	rax: te factoren getal
; 	rdi: pointer naar factors array

; return:

;	rcx: aantal factoren

prime_factors:

	push rax
	mov [p], rbx

;	mov	rdi, pf_s1
;	mov rsi, rax
;	mov rax, 0
;	call printf

	pop rax
	mov rcx, 0

loop_0:
	mov rbx, 2

loop_1:
	push rax
	mov rdx, 0
	div rbx
	cmp rdx, 0
	jz is_factor
	pop rax
	inc rbx
	cmp rbx, rax 
	jg done
	jmp loop_1
	
is_factor:
	add rsp, 8
	mov [f], rbx 
	push rax
;	mov rdi, pf_s2
;	mov rsi, rbx
;	mov rax, 0
;
;	call printf	
;
	pop rax
	mov rbx, [f]
	add rbx, [p]
	inc byte [rbx - 1]; 
	jmp loop_0

done:
	mov rdi, p
	ret
