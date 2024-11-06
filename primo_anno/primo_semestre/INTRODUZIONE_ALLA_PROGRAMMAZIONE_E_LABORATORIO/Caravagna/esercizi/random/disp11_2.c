#include <stdio.h>

float a_ric(int n, int p){
    if (n-1 == 1) return (p);
    float ric = a_ric(n-1, p);
    return((0.5) * (ric+(p / ric)));
}

int main (){
    int n, p;
    printf("Inserisci n maggiore o uguale di 1: ");
    scanf ("%d", &n);
    printf("Inserisci p: ");
    scanf ("%d", &p);

    printf("a_n+1,p ricorsiva vale: %f", a_ric(n, p));
}
