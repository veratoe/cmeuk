#include "stdio.h"
#include <math.h>

float is_prime(long long n) {
	long long int i;
	for (i = 2; i < n; i++) {
		//printf("%lli mod  %lli  %lli\n", n, i, n % i);
		if (n % i == 0) {
			return 0;
		}
	}
	return 1;
}

void print_factors(long long n) {
	for (long long i = 2; i < n; i++) {
		if (n % i == 0) {
			printf("%lli", i);
			if (is_prime(i)) printf("!");
			printf(" ");
		}
	}
	printf("\n");
}

/*int factor_by_prime(int n) {
	int p = 2;
	
	do {

	} while (n % p == 0);	
	return prime;
}*/

int main(int argc, char *argv[]) {
	long long int n = 1;
	if (argc < 2) {
		printf("Voer een getal in: ");
		scanf("%lli", &n);	
	} else {
		n = *argv[1];
		sscanf(argv[1], "%lli", &n);
	}
	if (is_prime(n) == 1) {
		printf("%lli is een priem-getal\n", n);
	} else {
		printf("%lli is geen priem-getal en deelbaar door ", n);
		print_factors(n);
	}
}
