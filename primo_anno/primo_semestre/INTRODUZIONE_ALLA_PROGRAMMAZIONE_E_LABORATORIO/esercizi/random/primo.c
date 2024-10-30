//  Si scriva una funzione ricorsiva "primo" che stabilisca se un numero x>0 sia primo
#include <stdio.h>

int primo(int x, int divisore, int divisore_max){
    if(x<2){
            return (0);
        }

    if (divisore > divisore_max){
        return (1);
    }
    
    if(x % divisore == 0){
        return (0);
    }
        
    return primo(x, divisore+1, divisore_max);
    
}

int main(){
    int x;

    printf("Inserisci numero maggiore di 0: ");
    scanf("%d", &x);
    
    int divisore_max = x/2;
    int divisore=2;
    
    if (primo(x, divisore, divisore_max)) {
        printf("%d è un numero primo.\n", x);
    } else {
        printf("%d non è un numero primo.\n", x);
    }

    return 0;

}