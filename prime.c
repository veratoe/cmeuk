#include <math.h>
#include <time.h>
#include <stdio.h>

float is_prime(long long n, int silent) {
	int primality = 1;
	long long int i;
	if (silent != 1) {
		printf("We testen %lli\n", n);
		printf("we gaan testen totaan: %f\n", sqrt(n));
	}
	for (i = 2; i < n / 2 + 1; i++) {
		if (n % i == 0) {
			if (silent != 1) {
				printf("factor: %lli", i);
				if (is_prime(i, 1)) {
					printf("!");
				}
				printf("\n");
			}
			primality = 0;
		}
	}
	return primality;
}

void print_factors(long long n) {
	for (long long i = 2; i < n; i++) {
		if (n % i == 0) {
			printf("%lli", i);
			if (is_prime(i, 0)) printf("!");
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
	clock_t start = 0, stop = 0;

	if (argc < 2) {
		printf("Voer een getal in: ");
		scanf("%lli", &n);	
	} else {
		n = *argv[1];
		sscanf(argv[1], "%lli", &n);
	}

	start = clock();

	if (is_prime(n, 0) == 1) {
		printf("%lli is een priem-getal\n", n);
	} else {
		printf("%lli is geen priem-getal", n);
		//print_factors(n);
	}

	stop = clock();

	printf("\nDit duurde %6.3f sec\n", (float) (stop - start) / CLOCKS_PER_SEC);
}
