#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <math.h>

long long int is_prime(long long int n) {
	for (long long int i = 2; i < sqrt(n) + 1; i++) {
		if (n % i == 0) {
			return 0;
		}
	}
	return 1;
}

void bereken_factoren(long long int n, int* ff, int *p) {
	for (long long int i = 2; i < n; i++) {
		if (n % i == 0) {
			*(ff + *p) = i;
			(*p)++;
		}
	}	
}

void print_factoren(int* ff, int p) {
	for (int i = 0; i < p; i++) {
		printf("factor %i: %i%s\n", i, ff[i], is_prime(ff[i]) ? "!" : "");
	}
}


void main (int argc, char *argv[]) {
	long long int l = 4;
	int* ff;
	int p = 0;
	clock_t start = 0, stop = 0;
	ff = malloc(10);

	if (argc > 1) {
		sscanf(argv[1], "%lli", &l);
	}
	printf("We kijken naar: %lli\n", l);
	start = clock();
	
	bereken_factoren(l, ff, &p);	
	printf("We vonden %i factoren %s\n", p, p == 0 ? " -> een priemgetal" : "");

	print_factoren(ff, p);

	stop = clock();

	printf("\nDit duurde %6.3f sec\n", (float) (stop - start) / CLOCKS_PER_SEC);

}
