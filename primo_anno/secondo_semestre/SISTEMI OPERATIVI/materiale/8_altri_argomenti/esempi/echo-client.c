#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#define SIZE 1024
#define MESSAGGIO "Ciao Mondo!\n"

int main(int argc, char *argv[]){

        int fd, n;
        char buffer[SIZE];
        struct sockaddr_in address;

        if ((fd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
            perror("socket failed");
            exit(EXIT_FAILURE);
        }

        address.sin_family = AF_INET;
        address.sin_port = htons(4242);
        if (inet_aton("45.79.112.203", &address.sin_addr) <=0){
            perror("convert server ip failed");
            exit(EXIT_FAILURE);        
        }

        if ((connect(fd, (struct sockaddr*)&address,sizeof(address)))< 0){
            perror("connect failed");
            exit(EXIT_FAILURE);        
        }
        
        write(fd, MESSAGGIO, sizeof(MESSAGGIO));
        printf("Tramesso: %s\n", MESSAGGIO);
        
        n = read(fd, buffer, SIZE);
        buffer[n] = 0;
        printf("Ricevuto: %s\n", buffer);
        close(fd);
        
}
