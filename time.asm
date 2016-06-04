section .bss

	start_time: resq 1

section .text

start_timing:
 	push rax
	RDTSC
	mov [start_time], rax
	pop rax
	ret

; we geven het verschil terug in rax
stop_timing:
	RDTSC
	sub rax, [start_time]
	ret


	
