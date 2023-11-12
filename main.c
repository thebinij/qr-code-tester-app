#include "functions.h"
#include "lodepng.h"
#include <stdio.h>
#include  <stdlib.h>

int main(int argc, char *argv[]){
    start_msg();
    unsigned error;
    unsigned char* image;
    unsigned int width, height; 

    const char* filename = argc > 1 ? argv[1] : "qrcode.png";

    error = lodepng_decode32_file(&image, &width, &height, filename);
    if(error) printf("decoder error %u: %s\n", error, lodepng_error_text(error));

    printf("Image dimensions: %u x %u\n", width, height);

    // Access pixel values (assuming RGBA format)
    if (width > 0 && height > 0) {
        printf("Top-left pixel values (RGBA): %u %u %u %u\n",
               image[0], image[1], image[2], image[3]);
    }

    free(image);
    return 0;
}