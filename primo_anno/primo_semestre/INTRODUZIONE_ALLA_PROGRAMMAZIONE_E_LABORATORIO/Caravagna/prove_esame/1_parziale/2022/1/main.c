#include <stdio.h>

double iterativa(int n) {
    if (n == 0) {
        return 1;
    } else if (n == 1) {
        return 3;
    } else {
        double s_0 = 1;  
        double s_1 = 3;  
        double s_n;

        for (int i = 2; i <= n; i++) {
            s_n = (s_1 + 3) / (2 * i) + s_0;
            s_0 = s_1;
            s_1 = s_n;
        }

        return s_n;
    }
}

double ricorsiva(int n) {
    if (n == 0) {
        return 1;
    } else if (n == 1) {
        return 3;
    } else {
        return (ricorsiva(n - 1) + 3) / (2 * n) + ricorsiva(n - 2);
    }
}

int main() {
    int n;

    printf("Inserisci n: ");
    scanf("%d", &n);

    while (n < 0) {
        printf("Numero non valido!\n");
        printf("Inserisci n: ");
        scanf("%d", &n);
    }

    printf("s(%d) (iterativa) = %lf\n", n, iterativa(n));
    printf("s(%d) (ricorsiva) = %lf\n", n, ricorsiva(n));

    return 0;
}
