#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    // gets a is the first argument and b is the second argument
    // prints a b times
    int b = atoi(argv[1]);
    for (int i = 0; i < b; i++) {
        printf("%s\n", argv[0]);
    }
}
