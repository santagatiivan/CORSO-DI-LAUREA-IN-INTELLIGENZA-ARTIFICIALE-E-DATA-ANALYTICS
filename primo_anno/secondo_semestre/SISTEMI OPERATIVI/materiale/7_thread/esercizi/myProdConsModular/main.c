#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include "ProdCons.h"
// Compile with: gcc ProdCons.c main.c -lpthread -o prod-sample

Queue * q;

void * producer(void *arg){
    int i = 0;
    for (i = 0; i < 1000; i++){
        char * s = malloc(50*sizeof(char));
        sprintf(s, "Elem-%d", rand());
        Queue_insert(q, (void*) s );
    }
    printf("Inserted all. Waiting 1 second for consumer to extract.\n");
    sleep(1);
    exit(0);
}

void * consumer(void *arg){
    int i = 1; 
    while (1){
        char * item = (char*) Queue_extract(q);
        printf("Extracted item %d: '%s'\n", i, item);
        free(item);
        i++;
    }
}

int main(int argc, char *argv[]){
    pthread_t t;
    q = Queue_init(10);
    pthread_create(&t, NULL, producer, NULL);
    consumer(NULL);
    Queue_destroy(q);
    return 0;
}
