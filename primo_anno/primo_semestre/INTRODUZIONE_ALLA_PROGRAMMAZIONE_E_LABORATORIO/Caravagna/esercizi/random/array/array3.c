//somma tutti i valori dell'array
#include <stdio.h>

int main() {
    int a[6] = {0, 1, -2, 6, 8, -1};
    int tot = 0;
    
    for(int i=0; i<=5; i++){
        tot += a[i];
    }

    printf("%d", tot);

    return 0;
}
