#include <stdio.h>
#include <stdlib.h>

int lunghezza(char stringa[]) {
    int lenght = 0;
    while (stringa[lenght] != '\0') {
        lenght++;
    }
    return lenght;
}

char* concatena_stringhe(char a1[], char a2[]) {
    int lunghezza1 = lunghezza(a1);
    int lunghezza2 = lunghezza(a2);

    char *risultato = (char *)malloc((lunghezza1 + lunghezza2 + 1) * sizeof(char));

    for (int i = 0; i < lunghezza1; i++) {
        risultato[i] = a1[i];
    }

    for (int i = 0; i < lunghezza2; i++) {
        risultato[lunghezza1 + i] = a2[i];
    }

    risultato[lunghezza1 + lunghezza2] = '\0';

    return risultato;
}

int main() {
    char a1[100], a2[100];

    printf("Inserisci prima stringa: ");
    scanf("%s", a1);
    printf("Inserisci seconda stringa: ");
    scanf("%s", a2);

    char *risultato = concatena_stringhe(a1, a2);

    printf("La stringa concatenata è: %s\n", risultato);

    free(risultato);

    return 0;
}
