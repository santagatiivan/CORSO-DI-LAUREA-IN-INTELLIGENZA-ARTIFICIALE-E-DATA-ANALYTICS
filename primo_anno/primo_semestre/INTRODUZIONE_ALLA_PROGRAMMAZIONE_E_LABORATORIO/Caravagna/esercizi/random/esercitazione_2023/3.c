#include <stdio.h>

void riordina(int a[], int n, int k) {
    int j = 0;
    for (int i = 0; i < n; i++) {
        if (a[i] <= k) {
            int temp = a[i];
            a[i] = a[j];
            a[j] = temp;
            j++;
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
    int a[] = {5, 8, 3, 0, 2, 4};
    int k = 6;
    int n = sizeof(a) / sizeof(a[0]);

    printf("Array originale: ");
    stampaArray(a, n);

    riordina(a, n, k);

    printf("Array riordinato: ");
    stampaArray(a, n);

    return 0;
}
