.global _start

.text

_start:

	mov 	$len, %edx
	mov 	$msg, %ecx
	mov 	$1, %ebx
	mov 	$4, %eax
	int $0x80

	mov		23, $wub

	mov 	$2, %edx
	mov		$wub, %ecx
	mov 	$1, %ebx
	mov 	$4, %eax
	int $0x80
	
	mov	$0, %ebx
	mov	$1, %eax
	int $0x80

.data

wub:
msg:
	.ascii "Wubmeister is hier\n"
	len = . - msg
