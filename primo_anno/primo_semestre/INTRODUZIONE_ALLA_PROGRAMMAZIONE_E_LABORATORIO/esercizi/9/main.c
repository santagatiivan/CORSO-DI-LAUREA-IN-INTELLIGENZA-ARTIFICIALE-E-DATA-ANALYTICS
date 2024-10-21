#include <stdio.h>

int main(){

    int a, b=0, c=1, d, n=0;  //a= elemento n-esimo della serie di fibonacci
                              //b= F0
                              //c= F1
                              //d= tot (valore prossima successione)
                              //n= contatore
    printf("Inserire n: ");
    scanf("%d", &a); 

    while (n <= a) {
        if (n == 0) {
            printf("F(%d) = %d\n", n, b);
        } else if (n == 1) {
            printf("F(%d) = %d\n", n, c);
        } else {
            d = b + c;
            printf("F(%d) = %d\n", n, d);
            b = c;
            c = d;
        }
        n++;
    }

    return 0;
}
