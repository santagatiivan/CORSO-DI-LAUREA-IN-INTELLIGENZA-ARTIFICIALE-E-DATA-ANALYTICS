//esercizisu produttorie e sommatorie che ho chiesto a chat gpt di generarmi
#include <stdio.h>
#include <math.h>

int SommatoriaSemplice_it(int n){
    int risultato = 0;

    for(int i = 1; i<=n; i++){
        risultato += i;
    }

    return (risultato);
}

int SommatoriaSemplice_ric(int n, int i){

    if(i == n) return (n);
    return (i + SommatoriaSemplice_ric(n,i+1));
}

int SommatoriaQuadrati_it (int n){
    int risultato = 0;

    for (int i =1; i<=n; i++){
        risultato += pow(i,2);
    }

    return (risultato);
}

int SommatoriaQuadrati_ric (int n, int i){

    if (i == n) return (pow(i, 2));
    return (pow(i, 2) + SommatoriaQuadrati_ric(n, i + 1));
}

int SommatoriaAlternata_it (int n){
    int risultato = 0;

    for(int i=1; i<=n; i++){
        risultato += pow(-1, i) * i;
    }

    return(risultato);
}

int SommatoriaAlternata_ric (int n, int i){
    if (i == n) return (pow(-1, i) * i);
    
    return ((pow(-1, i) * i) + SommatoriaAlternata_ric(n, i+1));
}

int ProduttoriaSemplice_it(int n){
    int risultato = 1;

    for(int i = 1; i<=n; i++){
        risultato *= i;
    }

    return (risultato);
}

int ProduttoriaSemplice_ric (int n, int i){

    if (i == n) return (i);
    return (i * ProduttoriaSemplice_ric(n, i+1));
}

int ProduttoriaQuadrati_it(int n){
    int risultato = 1;

    for(int i = 1; i <= n; i++){
        risultato *=  pow(i, 2);
    }

    return (risultato);
}

int ProduttoriaQuadrati_ric(int n, int i){
    if (i == n) return (pow(i, 2));
    return (pow(i, 2) * ProduttoriaQuadrati_ric(n, i+1));
}

int ProduttoriaDispari_it(int n){
    int risultato = 1;

    for(int i = 1; i<=n; i++){
        risultato *= ((2*i)-1);
    }

    return(risultato);
}

int ProduttoriaDispari_ric(int n, int i){
    if(i == n) return ((2*i)-1);
    return (((2*i)-1) * ProduttoriaDispari_ric(n, i+1));
}

int main(){
    int i = 1;
    int n;

    printf ("Inserisci n: ");
    scanf ("%d", &n);

    printf ("--------------\n");
    printf ("|SOMMATORIE |\n");
    printf ("-------------------------------------\n");
    printf ("Sommatoria semplice iterativa: %d\n", SommatoriaSemplice_it(n));
    printf ("Sommatoria semplice ricorsiva: %d\n", SommatoriaSemplice_ric(n, i));
    printf ("-------------------------------------\n");
    printf ("Sommatoria dei quadrati iterativa: %d\n", SommatoriaQuadrati_it(n));
    printf ("Sommatoria dei quadrati ricorsiva: %d\n", SommatoriaQuadrati_ric(n, i));
    printf ("-------------------------------------\n");
    printf ("Sommatoria alternata iterativa: %d\n", SommatoriaAlternata_it(n));
    printf ("Sommatoria alternata ricorsiva: %d\n", SommatoriaAlternata_ric(n, i));
    printf ("-------------------------------------\n");
    printf ("|PRODUTTORIE |\n");
    printf ("-------------------------------------\n");
    printf ("Produttoria semplice iterativa: %d\n", ProduttoriaSemplice_it(n));
    printf ("Produttoria semplice ricorsiva: %d\n", ProduttoriaSemplice_ric(n, i));
    printf ("-------------------------------------\n");
    printf ("Produttoria dei quadrati iterativa: %d\n", ProduttoriaQuadrati_it(n));
    printf ("Produttoria dei quadrati ricorsiva: %d\n", ProduttoriaQuadrati_ric(n, i));
    printf ("-------------------------------------\n");
    printf ("Produttoria dei numeri dispari iterativa: %d\n", ProduttoriaDispari_it(n));
    printf ("Produttoria dei numeri dispari ricorsiva: %d\n", ProduttoriaDispari_ric(n, i));
}


