# Introduzione
### imperativo

    1)attendere arrivo
    2)aprire porta
    3)entrare
    ...

  
### imperativo
diamo un ordine temporale (come una ricetta di cucina)

    1)attendere arrivo
    2)aprire porta
    3)entrare
    ...
  

### dichiarativo
ordini preceduti da condizioni (in base a una condizione fai un'azione)

    1)se ascensore qui, e la porta è aperta
    2)sali

### Programma
Descrizione eseguibile da un calcolatore di un metodo (algoritmo) per il calcolo di un risultato (output), a partire da un dato (input).

### Variabile
"nome" associato ad un valore MODIFICABILE

### Stato
Insieme di variabili che definiscono il programma

  

## 25/9/2024
#### esempio contadino russo
f(m,n)=m*n 

    1)crea var. p con valore 0.
    2)se m è pari, allora salto al 5)
    3)assegno p=p+n
    4)se m è 1, STOP
    5)assegno m=m/2
    6)balzo al 2)

  

m=7, n=4

    1)n=4, m=7
    2)p=0
    3)p=p+4
    4)m=3
    5)n=8
    6)p=p+8
    7)m=1
    8)n=16
    8)p=p+16
    10)stop

  

## 26/9/2024
#### variabili
quando programmeremo in c dovremo definire il tipo di una variabile. come:

- int -->numeri interi (1,2)

- double, float --> numero con virgola mobile (1,53)

- char --> lettera ('a', 'b')

#### Memoria: 
RAM: Random Access Memory
Indichiamo gli indirizzi della memoria come l0,l1,l2...



	int K=10000;	//km percoesi in un anno
	float b=0,2;		//costo benzina al km
	int c=20000;	//costo della macchina
	float tot;		//costo totale
		tot=b*K;
		tot+=c;		//tot=tot+c

#### istruzione condizionale if
    if(condizione){
        comando1;
    } else{
        comando2;
    }

La condizione è un’espressione logica a cui si può associare valore “vero” o “falso”, mentre comando1 e comando2 sono due programmi.


esempio di due if annidati:

    if(condizione1){
        if(condizione2){
            comando;
        }
    }

In questo esempio se ci troviamo dentro il secondo if, soddisfiamo la condizione di entrambi gli if.

condizione1 $\land$ condizione2 sono entrambe soddisfatte


#### espressioni logiche 

-   disuguaglianze: <, >, <=, >= (dove <= e >= stanno per ≤ e ≥, rispettiva-mente);

-   uguaglianza: ==;

-   diversità: != (che sta per $\neq$)

-   congiunzione && (“and” logico, ∧ in algebra);

-   disgiunzione || (“or” logico, ∨ in algebra);

-   negazione ! (“not” logico, ¬ in algebra);

## 1/10/2024
#### istruzione iterattiva while
    while(condizione){
        comando;
    }


## 2/10/2024
#### istruzione iterattiva do-while
Come l'istruzione while, ma vogliamo far per certo almeno una volta il comando

    do{
        comando;
    }while(condizione)

#### Istruzione iterativa for

    for(comando1; espressione; comando2){
        comando3;
    }

Il suo funzionamento consiste nelle seguenti computazioni:
1. si esegue comando1 (chiamato inizializzazione);
2. si valuta espressione (ovvero la condizione del for):
    -   se espressione è falsa, l’esecuzione del for termina;

    -   se espressione è vera: (i) si esegue comando3, il corpo del for, (ii) si esegue comando2 (chiamato aggiornamento) e (iii) si salta al punto 2.

#### Blocchi di codice e pile di frame


    { int x=7;
        {
            int z=5;
            x=z+1;
        }
    }

    -------------------------------------------------- POP   //chiudo il blocco
    -------------------------------------------------- POP   //chiudo il blocco
        ------------------       ------------------
        |   z   |   l1   |       |   l1   |   5   |          //assegno a z il suo frame
        ------------------       ------------------
    -------------------------------------------------- PUSH  //apro nuovo blocco
        ------------------       ------------------
        |   x   |   l0   |       |   l0   |   7   |          //assegno x il suo frame
        ------------------       ------------------
    -------------------------------------------------- PUSH  //apro il blocco

(qundo chiudo il blocco muoiono le variabili al suo )


    {
        int x=6;
            {
                int z=5;
                int x=z+1;
            }
            x=x+1
    }


    -------------------------------------------------- PUSH // inizio del programma
        ------------------       ------------------
        |   i   |  Global |       | Global |   0   |      // `i` inizializzato a 0, variabile globale
        ------------------       ------------------
    -------------------------------------------------- PUSH // chiama f(i) con i = 0
        ------------------       ------------------
        |   x   |   l0   |       |   l0   |   0   |        // `x` inizializzato a `i = 0`
        ------------------       ------------------
    -------------------------------------------------- POP   // inizio della chiamata f(i)
        ------------------       ------------------
        |   x   |   l0   |       |   l0   |   0   |        // valore di `x` prima dell'incremento
        ------------------       ------------------
        |   x   |   l1   |       |   l1   |   0   |        // valore di `x` nel blocco della funzione
        ------------------       ------------------
    -------------------------------------------------- PUSH // incremento di `x`
        ------------------       ------------------
        |   x   |   l1   |       |   l1   |   1   |        // `x` aggiornato a `0 + 1`
        ------------------       ------------------





