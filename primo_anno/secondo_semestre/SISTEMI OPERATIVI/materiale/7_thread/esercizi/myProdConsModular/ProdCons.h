#ifndef PRODCONS
#define PRODCONS

#include <semaphore.h>

typedef struct{
    int size, insert_pos, extract_pos;
    sem_t empty, full;
    void ** buffer;
} Queue;

Queue * Queue_init(int N);
void Queue_destroy(Queue * q);
void Queue_insert(Queue * q, void * item);
void * Queue_extract(Queue * q);

#endif
