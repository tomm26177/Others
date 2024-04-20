//SO IS1 214B lab08
//TOMASZ KAMINSKI
// kt53661@ut.edu.pl


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <ctype.h>
 
void execute_child(char *arg) {

execl("./SOzad2","SOzad2",arg(char*)0)

}
 
int main(int argc, char *argv[]) {
    if (argc != 2 || strlen(argv[1]) > 25) {
        fprintf(stderr, "Błąd: Program przyjmuje dokładnie jeden argument o długości od 1 do 25.\n");
        return 1;
    }
 
    for (int i = 0; i < strlen(argv[1]); i++) {
        if (!isdigit(argv[1][i])) {
            fprintf(stderr, "Błąd: Argument powinien składać się tylko z cyfr dziesiętnych.\n");
            return 1;
        }
    }
    if (strlen(argv[1]) == 1) {
        return atoi(argv[1]);
    }
 
    int len = strlen(argv[1]);
    int mid = len / 2;
 
    pid_t child1 = fork();
 
    if (child1 == 0) {
        execute_child(strndup(argv[1], mid));
    } else if (child1 > 0) {
 
        pid_t child2 = fork();
 
        if (child2 == 0) {
            execute_child(strndup(argv[1] + mid, len - mid));
        } else if (child2 > 0) {
            int status1, status2;

            waitpid(child1, &status1, 0);
            waitpid(child2, &status2, 0);
 
            printf("%d %d %s %d\n", getpid(), child1, argv[1], WEXITSTATUS(status1));
            printf("%d %d %s %d\n", getpid(), child2, argv[1] + mid, WEXITSTATUS(status2));
 
            return WEXITSTATUS(status1) + WEXITSTATUS(status2);
        } else {
            perror("Błąd fork()");
            return 1;
        }
    } else {
        perror("Błąd fork()");
        return 1;
    }
}