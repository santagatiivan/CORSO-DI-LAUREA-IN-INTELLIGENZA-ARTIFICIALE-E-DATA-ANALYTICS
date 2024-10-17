#include <stdio.h>

int main(){
    float x = 1, y = 0, i = 0;
    float media;

    while (x != 0){
        printf("Inserisci un numero (x_%d) (0 per terminare): ", i + 1);
        scanf("%d", &x);
        printf("%d", x);
        y =y+x; 
        i++;    
    
    }
        media = y / i; 
        printf("La media dei numeri inseriti è: %d", y);

    return 0;
}
