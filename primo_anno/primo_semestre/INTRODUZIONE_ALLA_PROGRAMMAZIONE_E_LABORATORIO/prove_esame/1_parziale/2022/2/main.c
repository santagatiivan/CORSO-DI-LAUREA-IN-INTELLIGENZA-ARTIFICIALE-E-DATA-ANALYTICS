#include <stdio.h>
#include <math.h>

int primo (int x){

    if (x < 2) {
        return 0;
    }

    for (int i = 2; i <= sqrt(x); i++) {
        if (x % i == 0) {
            return 0; 
        }
    }

    return 1;
}


int ricorsiva (){

}

int main (){

int x;

printf("Inserire x: ");
scanf("%d", &x); 

    return 0;
}