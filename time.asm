section .bss

	start_time: resq 1

section .text

global start
global stop

start:
 	push rax
	RDTSC
	mov [start_time], rax
	pop rax
	ret

; we geven het verschil terug in rax
stop:
	RDTSC
	sub rax, [start_time]
	ret


	
