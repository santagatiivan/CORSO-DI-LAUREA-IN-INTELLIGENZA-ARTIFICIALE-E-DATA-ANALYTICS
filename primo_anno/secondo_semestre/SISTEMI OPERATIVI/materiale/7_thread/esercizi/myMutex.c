#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>

typedef struct{
    sem_t s;
} Mutex;

Mutex * Mutex_init(){
    Mutex * m = malloc (sizeof(Mutex));
    sem_init( &m->s , 0, 1);
    return m;
}

void Mutex_destroy(Mutex * m){
    free(m);
}

void Mutex_lock(Mutex * m){
    sem_wait( &m->s );
}

void Mutex_unlock(Mutex * m){
    int v;
    sem_getvalue(&m->s, &v);
    if (v<1)
        sem_post( &m->s );
    else{
        fprintf(stderr, "Invoked Mutex_unlock on an unlocked Mutex\n");
        exit(1);
   }
}

static int glob = 0;
Mutex * mtx;

static void * threadFunc(void *arg){
    int loops = *((int *) arg);
    int loc, j;
    for (j = 0; j < loops; j++) {
        Mutex_lock(mtx);         /*    LOCK            */
        loc = glob;                 /* ┰                  */
        loc++;                      /* ┃ Critical Section */
        glob = loc;                 /* ┻                  */
        Mutex_unlock(mtx);       /*    RELEASE         */
    }
    return NULL;
}
int main(int argc, char *argv[]){
    pthread_t t1, t2;
    int loops = 10000000;
    
    mtx = Mutex_init();
    pthread_create(&t1, NULL, threadFunc, &loops);
    pthread_create(&t2, NULL, threadFunc, &loops);
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    printf("glob = %d\n", glob);
    Mutex_destroy(mtx);
    exit(0);
}
