//somma 1 a ogni indice pari
#include <stdio.h>

int main() {
    int a[6] = {0, 1, -2, 6, 8, -1};
    int i = 0;
    
    while (i <= 5){
        a[i]++;
        printf("%d, ", a[i]);
        i=i+2;
    }
}