#include <stdio.h>
#include <math.h> 

int calcola_somma(int n, int k) {
    int somma = 0;

    if(n==0){
        somma=1;
        return somma;
    }else{
        for (int i = 1; i <= k; i++) {
            somma += pow(n, i);
        }
    }
    
    return somma;
}

int main() {
    int n, k;

    printf("Inserire k: ");
    scanf("%d", &k);
    printf("Inserire n: ");
    scanf("%d", &n);

    int risultato = calcola_somma(k, n);

    printf("Risultato sommatoria: %d\n", risultato);

    return 0;
}
