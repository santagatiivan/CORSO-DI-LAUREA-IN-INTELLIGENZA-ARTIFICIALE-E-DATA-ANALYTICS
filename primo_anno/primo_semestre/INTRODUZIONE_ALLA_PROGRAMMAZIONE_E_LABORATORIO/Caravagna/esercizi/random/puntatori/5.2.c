#include <stdio.h>

void scambia(int *p, int *q){
    int tmp= *p;

    *p= *q;
    *q= tmp;
}


int main(){
    int a = 1;
    int b = 2;

    printf("Prima dello scambio:\n");
    printf("a = %d\n", a);
    printf("b = %d\n", b);

    scambia(&a, &b);

    printf("Dopo lo scambio:\n");
    printf("a = %d\n", a);
    printf("b = %d\n", b);

    return 0;
}