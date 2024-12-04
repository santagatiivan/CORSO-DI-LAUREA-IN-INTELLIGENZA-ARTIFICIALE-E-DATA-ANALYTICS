 //prende valori e li somma di un array di indice 5
 #include <stdio.h>

 int main(){
    int a[5];

    for(int i=0; i<5; i++){
        scanf("%d", &a[i]);
    }

    int totale = 0;

    for(int i=0; i<5; i++){
       totale += a[i];
    }

    printf("Somma totale elementi array: %d", totale);
 }