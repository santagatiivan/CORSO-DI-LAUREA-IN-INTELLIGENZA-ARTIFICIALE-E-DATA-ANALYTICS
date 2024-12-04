#include <stdio.h>
#include <stdlib.h>

int contaDuplicati(int a[], int n) {
	int duplicati = 0;

	for (int i = 0; i < n; i++) {
		for (int j = i + 1; j < n; j++) {
			if (a[i] == a[j]) {
				duplicati++;
				break;
			}
		}
	}

	return duplicati;
}

void eliminaDuplicati(int a[], int a2[], int n) {
	int index = 0;

	for (int i = 0; i < n; i++) {
		int trovato = 0; 
		for (int j = 0; j < index; j++) {
			if (a[i] == a2[j]) {
				trovato = 1; 
				break;
			}
		}
		if (!trovato) {
			a2[index] = a[i]; 
			index++;
		}
	}
}

void stampaArray(int a[], int n) {
	printf("[");
	for (int i = 0; i < n; i++) {
		printf("%d", a[i]);
		if (i < n - 1) printf(", ");
	}
	printf("]\n");
}

int main() {
	int a[] = {5, 5, 8, 8, 3, 3, 0, 0, 2, 2, 4, 4};
	int n = sizeof(a) / sizeof(a[0]);

	int duplicati = contaDuplicati(a, n);
	printf("Numero di duplicati: %d\n", duplicati);

	int n2 = n - duplicati;

	int *a2 = (int *)malloc(n2 * sizeof(int));

	eliminaDuplicati(a, a2, n);
	printf("Array iniziale:\n");
	stampaArray(a, n);
	printf("Array senza duplicati:\n");
	stampaArray(a2, n2);
	free(a2);

	return 0;
}
