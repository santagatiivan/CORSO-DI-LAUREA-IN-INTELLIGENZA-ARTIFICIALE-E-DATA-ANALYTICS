#include <stdio.h>

int potenza_2(int y){
    if (y==1) return (1);
    if (y % 2 == 0) return (potenza_2(y/2));
    else{
        return (0);
    }
}

int sommatoria(int i) {
    if (i <= 1) return 0;  
    return (i - 1) * potenza_2(i - 1) + sommatoria(i - 1);
}

int produttoria(int i) {
    if (i <= 1) return 1;  
    int term = (1 - potenza_2(i - 1)) * (1 << i); 
    return term * produttoria(i - 1); 
}

int pi_n(int n) {
    if (n <= 0) return 0; 
    return sommatoria(n) + produttoria(n) + pi_n(n - 1);
}

int main() {
    int n;

    printf("Inserisci un numero positivo: ");
    scanf("%d", &n);
    int result = pi_n(n);
    printf("Il valore di pi_%d è: %d\n", n, result);
    return 0;
}
