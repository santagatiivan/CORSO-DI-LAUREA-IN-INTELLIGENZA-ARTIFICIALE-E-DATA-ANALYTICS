#include <stdio.h>

int fattoriale(int numeratore) {
    if (numeratore == 0) return 1;
    int risultato = 1;
    for (int i = 1; i <= numeratore; i++) {
        risultato *= i;
    }
    return risultato;
}

int coefficienteBinomiale(int n, int k) {
    if (k > n) return 0; // C(n, k) = 0 se n < k
    int numeratore = fattoriale(n);
    int denominatore = fattoriale(k) * fattoriale(n - k);
    return numeratore / denominatore;
}

int main() {
    int n, k;

    printf("Inserire n: ");
    scanf("%d", &n);
    printf("Inserire k: ");
    scanf("%d", &k);

    if (n < k) {
        printf("Errore: n deve essere maggiore o uguale a k.\n");
    } else {
        int risultato = coefficienteBinomiale(n, k);
        printf("Coefficiente binomiale di %d su %d è: %d\n", n, k, risultato);
    }

    return 0;
}
