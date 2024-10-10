#include <stdio.h>

int main() {
    int n, x, min, max;

    printf("Quanti numeri vuoi confrontare? ");
    scanf("%d", &n);

    if (n <= 0) {
        printf("Il numero deve essere maggiore di 0.\n");
        return 1;
    }

    printf("Inserisci numero: ");
    scanf("%d", &x);
    min = max = x;

    for (int i = 1; i < n; i++) {
        printf("Inserisci numero: ");
        scanf("%d", &x);

        if (x > max) {
            max = x;
        }
        if (x < min) {
            min = x;
        }
    }

    printf("MAX: %d", max);
    printf("   ||   MIN: %d", min);
    
    return 0;
}
