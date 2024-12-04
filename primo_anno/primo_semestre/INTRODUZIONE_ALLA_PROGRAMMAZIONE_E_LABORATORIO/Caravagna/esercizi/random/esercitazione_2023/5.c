#include <stdio.h>

void gira(int a[], int n, int k) {

    k = k % n; 
    if (k < 0) k += n;


    int temp[n];
    

    for (int i = 0; i < k; i++) {
        temp[i] = a[n - k + i];
    }

    for (int i = 0; i < n - k; i++) {
        temp[k + i] = a[i];
    }

    for (int i = 0; i < n; i++) {
        a[i] = temp[i];
    }
}


void stampaArray(int a[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");
}

int main() {
    int a[6] = {0, 2, 5, 1, 10, 7};
    int n = sizeof(a) / sizeof(a[0]);
    int k;

    k = 3;
    gira(a, n, k);
    stampaArray(a, n);

    k = -2;
    gira(a, n, k);
    stampaArray(a, n);

    return 0;
}
