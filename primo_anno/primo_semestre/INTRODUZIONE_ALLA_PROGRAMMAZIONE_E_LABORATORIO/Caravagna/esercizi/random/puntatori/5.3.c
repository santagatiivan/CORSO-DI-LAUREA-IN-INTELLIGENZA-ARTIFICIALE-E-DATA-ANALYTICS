#include <stdio.h>

incrementa (int *p, int q){
    *p= *p + q;
}

int main(){
    int a= 1;
    int b= 5;

    printf("prima dell aumento:");
    printf("a= %d", a);
    printf("b= %d", b);

    incrementa(&a, 5); //aumenta a di 5
    incrementa(&b, 7); //aumenta b di 7

    printf("dopo l'aumento:");
    printf("a= %d", a);
    printf("b= %d", b);

    return 0;
}