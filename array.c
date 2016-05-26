#include <stdio.h>
#include <stdlib.h>

typedef struct {
	int* array;
	size_t used;
	size_t size;
} Array;

void push_on_array(Array *a, int element) {
	if (a->used == a->size) {
		a->size *= 2;
		a->array = (int *) realloc(a->array, a->size * sizeof(int));
	}
	a->array[a->used++] = element;
}

void create_array(Array *a, size_t size) {
	a->array = (int *) malloc(size * sizeof(int));
	//a->used = 0;
	//a->size = size;
}

void free_array(Array *a) {
	free(a->array);
	a->array = NULL;
	a->used = a->size = 0;
}

void main() {
	Array *a;

	create_array(a, 20);
	printf("Dat ging goed\n");
}
