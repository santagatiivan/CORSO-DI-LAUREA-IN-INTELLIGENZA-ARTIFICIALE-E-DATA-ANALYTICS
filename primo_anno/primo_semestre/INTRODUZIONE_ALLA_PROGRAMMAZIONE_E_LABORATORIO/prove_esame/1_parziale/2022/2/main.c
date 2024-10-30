#include <stdio.h>

int primo (int k, int divisore,  int divisore_max){
    if (k<2) return (0);
    if (divisore > divisore_max) return (1);
    if (k % divisore == 0) return (0);

    return (primo(k, divisore + 1, divisore_max));
}

int calcola_pi_k_n(int k, int n){
    if (k > n) return 0;
    return k * primo(k, 2, k/2) + calcola_pi_k_n(k + 1, n);
}

int main(){
    int result = calcola_pi_k_n(3, 21);
    printf("Il valore di π_{3,21} è: %d\n", result);

    return 0;
}