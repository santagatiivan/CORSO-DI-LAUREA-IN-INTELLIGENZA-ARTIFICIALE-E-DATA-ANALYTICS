#include <stdio.h>

int main(){
    int x;

    printf("Inserisci il numero (x): ");
    scanf("%d", &x);

    while (x == 0){
        printf("Il numero non può essere zero. Inserisci di nuovo il numero (x): ");
        scanf("%d", &x);
    }

    if (x > 0){
        printf("Il numero %d è positivo\n", x);
    } else{
        printf("Il numero %d è negativo\n", x);
    }

    printf ("Il valore assoluto di |%d| = %d ", x, x*(-1));

    return 0;
}
