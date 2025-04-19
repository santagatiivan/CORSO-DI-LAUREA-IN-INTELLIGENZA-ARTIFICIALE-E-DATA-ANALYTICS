#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#define SIZE 1024

int main(int argc, char *argv[]){

    if (argc<2){
        printf("Usage: message c/s [addr] port\n");
        exit(EXIT_FAILURE);
    }

    if (strcmp(argv[1], "s")==0){
        int fd, new_socket, addrlen, n;
        char buffer[SIZE];
        struct sockaddr_in address;

        if (argc!=3){
            printf("Usage: chat s port\n");
            exit(EXIT_FAILURE);
        }

        printf("Server mode (receiver)\n");

        if ((fd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
            perror("socket failed");
            exit(EXIT_FAILURE);
        }
        
        if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &(int){1}, sizeof(int)) == -1){
            perror("setsockopt failed");
            exit(EXIT_FAILURE);
        }

        address.sin_family = AF_INET;
        address.sin_addr.s_addr = INADDR_ANY;
        address.sin_port = htons(atoi(argv[2]));
     
        if (bind(fd, (struct sockaddr*)&address, sizeof(address)) < 0) {
            perror("bind failed");
            exit(EXIT_FAILURE);
        }

        if (listen(fd, 3) < 0) {
            perror("listen failed");
            exit(EXIT_FAILURE);
        }

        printf("Listening on port: %s\n", argv[2]);

        addrlen = sizeof(address);
        while (1){

            if ((new_socket  = accept(fd, (struct sockaddr*)&address, (socklen_t*)&addrlen)) < 0) {
                perror("accept failed");
                exit(EXIT_FAILURE);
            }

            printf("New connection from: %s\n", inet_ntoa(address.sin_addr));

            while ( (n = read(new_socket, buffer, SIZE))>0 )
                write(1, buffer, n);

            printf("Connection closed\n");
            close(new_socket);
        }

    } else if (strcmp(argv[1],"c")==0){
        int fd, new_socket, n;
        char buffer[SIZE];
        struct sockaddr_in address;

        if (argc!=4){
            printf("Usage: chat c address port\n");
            exit(EXIT_FAILURE);
        }

        printf("Client mode (sender)\n");

        if ((fd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
            perror("socket failed");
            exit(EXIT_FAILURE);
        }

        address.sin_family = AF_INET;
        address.sin_port = htons(atoi(argv[3]));
        if (inet_aton(argv[2], &address.sin_addr) <=0){
            perror("convert server ip failed");
            exit(EXIT_FAILURE);        
        }

        if ((connect(fd, (struct sockaddr*)&address,sizeof(address)))< 0){
            perror("connect failed");
            exit(EXIT_FAILURE);        
        }

        printf("Connected to %s:%s\n", argv[2], argv[3]);
        while ( (n = read(0, buffer, SIZE))>0 )
            write(fd, buffer, n);
    }
    else{
        printf("Usage: message c/s [addr] port\n");
        exit(EXIT_FAILURE);      
    }
    return 0;
}
