# 1 "lab01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab01.c"
# 23 "lab01.c"
void setPixel(int, int, unsigned short);
void drawTriangle(int, int);


unsigned short *videoBuffer = (unsigned short *)0x6000000;

int main() {

    (*(unsigned short *)0x4000000) = 3 | (1<<10);


    drawTriangle(30, 30);
    drawTriangle(70,70);
    drawTriangle(100,90);


    while(1);
}



void setPixel(int row, int col, unsigned short color) {





    videoBuffer[((col)*(240)+(row))] = color;


}

void drawTriangle(int row, int col) {




    for (int i = 0; i < 20; i++ ) {
        setPixel(row + i, col, ((31) | (31)<<5 | (31)<<10));
    }

    for (int i = 0; i < 20; i++) {
        setPixel(row, col + i, ((31) | (0)<<5 | (31)<<10));
    }


    for (int i = 0; i < 20; i++) {
        setPixel(row + 19 - i, col + i, ((0) | (0)<<5 | (31)<<10));
    }
}
