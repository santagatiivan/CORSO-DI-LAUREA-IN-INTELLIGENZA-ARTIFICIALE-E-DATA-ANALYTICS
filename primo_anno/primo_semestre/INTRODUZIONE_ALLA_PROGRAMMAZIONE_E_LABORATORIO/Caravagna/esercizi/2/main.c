#include <stdio.h>

int main (){
    int a, b;
    printf("Inserisci il primo numero (a): ");
    scanf("%d", &a); 
    printf("Inserisci il secondo numero (b): ");
    scanf("%d", &b); 
    
    while (b == 0) {
        printf("Il secondo numero non può essere zero. Inserisci di nuovo il secondo numero (b): ");
        scanf("%d", &b);
    }

    printf("La somma di a + b: %d\n", a + b);
    printf("La differenza di a - b: %d\n", a - b);
    printf("Il prodotto di a * b: %d\n", a * b);
    printf("La divisione di a / b: %d\n", a / b); 

    return 0;
}
