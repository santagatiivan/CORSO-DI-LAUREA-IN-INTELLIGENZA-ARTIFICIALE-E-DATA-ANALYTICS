//incrementa di 1 i valori con indice pari
#include <stdio.h>

int main(){
    int a[9] = {1, 3, 2, 0, 1, 0, 3, 5, 9};

    for(int i=0; i<9; i++){
        if(i%2 == 0){
            a[i] += 1;
        }
    }
}