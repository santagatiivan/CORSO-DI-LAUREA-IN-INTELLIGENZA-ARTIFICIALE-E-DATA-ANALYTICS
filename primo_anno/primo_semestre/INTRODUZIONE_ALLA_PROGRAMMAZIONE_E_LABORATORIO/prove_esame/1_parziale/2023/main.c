#include <stdio.h>

int f(int p, int s){
    while(p<s){
        printf("|%d|%d|\n", s, p);
        s++;
        p=p+2;
        
    }
    //A
    printf("-------- \n");
    printf("| p: %d | \n", p);
    printf("| s: %d |\n", s);
    printf("-------- \n\n");
    return (p);
}

void main(){
    int p=7;

    for(int i=0; i<3; i++){
        int p = f(i,p); //B
    }
    //C
}