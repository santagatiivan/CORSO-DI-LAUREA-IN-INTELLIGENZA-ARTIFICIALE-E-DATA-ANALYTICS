#include <stdio.h>

int main (){
    int x, y;

    for(int i=1; i<=5; i++){
        printf("Inserisci numero (x_%d): ", i);
        scanf ("%d", &y);
        x=x+y;
    }
    
    printf ("La somma dei numeri inseriti è: %d", x);
}