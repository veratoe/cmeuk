#include "stdio.h"

int i_max = 10;

int ass() {
	__asm__ (	
				"movl $10, %eax;"
				"movl $20, %ebx;"
				"addl %ebx, %eax;"
	);
}

void main() {
	unsigned int 
		n1 = 1,
		n2 = 1,
		i = 0,
		sum = 0,
		sum_even = 0;

	ass();
	printf("ass called\n");

	do {
		i++;
		sum = n1 + n2;
		n1 = n2;
		n2 = sum;
		if (sum % 2 == 0) {
			sum_even += sum;
		}
		printf("stap %d: %d + %d = %d, som even: %d\n", i, n1, n2, n1 + n2, sum_even);
	} while (n2 < 4000000);

	printf("Totaal tot %d: %d\n", i, sum);
	printf("Totaal even %d: %d\n", i_max, sum_even);
}
