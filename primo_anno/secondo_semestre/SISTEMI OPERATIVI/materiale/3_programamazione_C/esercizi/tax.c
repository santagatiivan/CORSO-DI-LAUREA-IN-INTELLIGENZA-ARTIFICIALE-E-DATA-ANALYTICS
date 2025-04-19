#include <stdio.h>
#include <stdlib.h>
// Test with: export R=30000 ; echo "scale=3 ; $(./tax $R) / $R" |  bc
// Or: for i in $(seq 5000  5000 300000) ; do echo -n "$i " ; echo "scale=3 ; $(./tax $i) / $i" |  bc ; done

int aliquote   [] = {  23,      25,      35,      43 };
int scaglioni  [] = {0,   15000,   28000,   50000    }; 

int main(int argc, char *argv[]){
    int importo, tasse=0, i;
    int aliquote_nb = sizeof(aliquote) / sizeof(int);

    if (argc != 2){
        printf("Uso: tax importo\n");
        return 1;
    }
    
    importo = atoi(argv[1]);
    for (i = 0; i<aliquote_nb-1; i++){
        if (importo > scaglioni[i+1] - scaglioni[i]){
            tasse += (scaglioni[i+1] - scaglioni[i])*aliquote[i]/100;
            importo -= (scaglioni[i+1] - scaglioni[i]);
        }
        else{
            tasse += importo*aliquote[i]/100;
            importo -= (scaglioni[i+1] - scaglioni[i]);
            break;
        }
    }
    if (importo>0)
        tasse += importo*aliquote[aliquote_nb-1]/100;

    printf("%d\n", tasse);
    return 0;
}
