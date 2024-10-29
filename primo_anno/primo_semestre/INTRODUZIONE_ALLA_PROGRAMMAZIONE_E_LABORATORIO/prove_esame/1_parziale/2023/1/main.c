#include <stdio.h>

int sn_ric(int n) {
    if (n <= 1) {
        return (n + 1); 
    }
    return ((n * sn_ric(n - 1) + 3) / sn_ric(n - 2));
}


int sn_it(int n) {
    if (n <= 1) {
        return (n + 1); 
    }

    int meno1 = 2; 
    int meno2 = 1; 
    int sn;

    for (int i = 2; i <= n; i++) {
        sn = (i * meno1 + 3) / meno2;

        meno2 = meno1;
        meno1 = sn;
    }

    return sn; 
}


int fino_a(float epsilon){

}


int main() {
    int n;

    printf("Inserisci n: ");
    scanf("%d", &n);

    printf("Sn (ricorsiva): %d\n", sn_ric(n));
    printf("Sn (iterativa): %d\n", sn_it(n));
    return 0;
}