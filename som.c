#include <stdio.h>
int main() {
	int i,n, a = 0;

	printf("Hoi, we gaan de som berekenen\n");
	scanf("%d", &n);

	for (i = 0; i < n; i++) {
		if (i % 5 == 0 || i % 3 == 0) {
			a += i;
		}
	}

	printf("We berekenden de som van veelvouden 3 en 5 voor %d\n", n);
	printf("Het antwoord is: %d\n", a);
}
