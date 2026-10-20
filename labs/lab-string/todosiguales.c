#include <stdio.h>
#include "String.h"

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("1\n");
        return 0;
    }

    char *primero = argv[1];
    for (char **arg = argv + 2; *arg != NULL; arg++) {
        if (!AreEqual(primero, *arg)) {
            printf("0\n");
            return 0;
        }
    }

    printf("1\n");
    return 0;
}
