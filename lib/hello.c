#include <stdio.h>
#include "functions.h"

const char *get_message(void) {
    return "------Welcome to PNG Decoding App!------\n";
}

void start_msg(void) {
    printf("%s\n", get_message());
}