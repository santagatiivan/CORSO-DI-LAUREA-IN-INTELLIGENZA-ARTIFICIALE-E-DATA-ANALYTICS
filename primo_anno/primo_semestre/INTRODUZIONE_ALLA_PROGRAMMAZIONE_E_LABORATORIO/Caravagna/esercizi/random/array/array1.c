//scambia i valori negativi nel array con lo 0
#include <stdio.h>

int main() {
    int a[6] = {0, 1, -2, 6, 8, -1};

    for (int i = 0; i < 6; i++) {
        if (a[i] < i) {
            a[i] = 0;
        }
        printf("%d, ", a[i]);
    }

    return 0;
}
