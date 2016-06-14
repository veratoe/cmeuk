%include "factors.asm"

extern printf

section .data
	s1: db "%d ", 0
	s_pr: db "Uitkomst is nu: %lld voor %d", 10, 0
	s_check: db ":check!", 10, 0
	s_error: db "Woeps, niet goed deelbaar!", 10, 0
	nl: db 10, 0
	n: db 2

section .bss

	pP: resb 20
	fP: resb 20

section .text

global _start

_start:

_main_loop:	
	
_factoren:

; maak fP leeg
	mov rcx, 0
_clear_fP:
	mov byte [fP + ecx], 0
	inc rcx
	cmp rcx, 20
	jbe _clear_fP

; lekker factoreren
	mov rax, 0
	mov al, [n]
	mov rbx, fP
	call prime_factors
	push rax

; vgl exponentenc
	mov rcx, 0

_compare_exponents: 
	mov al, [fP + rcx]
	mov bl, [pP + rcx]
	cmp al, bl
	jb _cp1
	mov byte [pP + rcx], al
_cp1:
	inc rcx
	cmp rcx, 20
	jb _compare_exponents

; print de stand van zaken
	mov rcx, 0

_print:
	mov rdi, s1
	mov rbx, 0
	mov bl, byte [pP + rcx]
	mov rsi, rbx	
	mov rax, 0
	push rcx
	call printf

	pop rcx
	inc rcx
	cmp rcx, 20
	jb _print
	
	mov rdi, nl
	mov rsi, 0
	mov rax, 0
	call printf

; product van de rambam berekenen

	mov rax, 1
	mov rcx, 1
	mov rbx, 0

_calculate_product:
	mov bl, byte [pP + rcx - 1]

_cp_loop:
	cmp bl, 0
	je _cp_done
	mul rcx
	dec bl
	jmp _cp_loop
			
_cp_done:
	inc rcx
	cmp rcx, 20
	jbe _calculate_product

	push rax
	mov rdi, s_pr
	mov rsi, rax
	mov rdx, 0 
	mov dl, [n]
	mov rax, 0
	call printf

	mov rcx, 0
	mov cl, [n]
_factoratie_test:

	pop rax
	push rax
	mov rdx, 0
	div rcx
	cmp rdx, 0
	jnz _error
	dec rcx
	cmp rcx, 0
	je _ft_done
	jmp _factoratie_test
   
_error:
	mov rdi, s_error
	mov rsi, 0
	mov rax, 0
	call printf
	; er ging iets fout
	jmp _le_done

_ft_done:
	mov rdi, s_check
	mov rsi, 0
	mov rax, 0
	call printf

_done:
; check de main loop
	inc byte [n]
	cmp byte [n], 20
	jbe _factoren

_le_done:

; exit
	mov rax, 60
	mov rdi, 0
	syscall
