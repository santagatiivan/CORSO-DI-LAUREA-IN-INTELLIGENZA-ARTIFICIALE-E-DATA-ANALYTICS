//assegna 0 alle celle con valore negativo
#include <stdio.h>

int main(){
    int a[7] = {2, -1, 0, 1, -1, 0, -3};

    for(int i=0; i<7; i++){
        if(a[i]<0){
            a[i]=0;
        }
    }

    
    printf("Array modificato:\n");
    for (int i = 0; i < 7; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");

    return 0;
}