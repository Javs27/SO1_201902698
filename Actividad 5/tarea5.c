#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

void *thread_function(void *arg) {
    
    printf("NUEVO HILO HA SIDO CREADO.\n");
    return NULL;
}

int main() {
    pid_t pid;
    pthread_t thread_id;

    pid = fork(); 

    if (pid == 0) {
        fork(); 
        pthread_create(&thread_id, NULL, thread_function, NULL); 
    }
    
    fork(); 

   
    if (pid == 0) {
        pthread_join(thread_id, NULL);
    }

    return 0;
}