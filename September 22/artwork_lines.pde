void setup() {
  size(900, 900);
  background(255);
  frameRate(3);
}

float a;

void draw () {
  firstLightBlueLines(0, 50);
  firstDarktBlueLines(0, 50);
  firstGreyLines(0, 50);
  secondLightBlueLines(0, 50);
  secondDarkBlueLines(0, 50);
  secondGreyLines(0, 50);
  thirdLightBlueLines(0, 50);
  thirdDarkBlueLines(0, 50);
  thirdGreyLines(0, 50);
  horizontalLightBlueLines(0, 50);
  horizontalDarkBlueLines(0, 50);
  horizontalGreyLines(0, 50);
  
  saveFrame("gif_####.png");
}

//VERTICAL DIRECTION
//These are the three lines that make up the first rectangle
//first blue line
void firstLightBlueLines(int h, int hs) {
  stroke(119, 158, 203);
  while (h < width+80) {
    line(0, h-80+a, 230, h+a);
    h=h+hs;
    a=a-0.5;
    if (a < 0) { 
    a = height;
    }
  }
}

//first dark blue line
void firstDarktBlueLines(int h, int hs) {
  stroke(48, 101, 172);
  while (h < width+120) {
    line(230, h+a, 400, h-520+a);
    h=h+hs;
    a=a-0.01;
    if (a < 0) { 
    a = height;
    }
  }
}

//first grey line
void firstGreyLines(int h, int hs) {
  stroke(174, 198, 207);
  while (h < width+120) {
    line(400, h-520+a, 170, h+a);
    h=h+hs;
    a=a-0.1;
  }
}
//These are the three lines that make up the second rectangle
//second blue line
void secondLightBlueLines(int h, int hs) {
  stroke(119, 158, 203);
  while (h < width+120) {
    line(170, h+a, 500, h+300+a);
    h=h+hs;
    a=a-0.5;
    if (a < 0) { 
    a = height;
    }
  }
}

//second dark blue line
void secondDarkBlueLines(int h, int hs) {
  stroke(48, 101, 172);
  while (h < width+120) {
    line(500, h+300+a, 600, h+20+a);
    h=h+hs;
    a=a-0.03;
    if (a < 0) { 
    a = height;
    }
  }
}

//second grey line
void secondGreyLines(int h, int hs) {
  stroke(174, 198, 207);
  while (h < width+120) {
    line(600, h+20+a, 370, h+80+a);
    h=h+hs;
    a=a-3;
  }
}

//These are the three lines that make up the third rectangle
//third blue line
void thirdLightBlueLines(int h, int hs) {
  stroke(119, 158, 203);
  while (h < width+80) {
    line(370, h+80+a, 830, h+160+a);
    h=h+hs;
    a=a+-0.3;
    if (a < 0) { 
    a = height;
    }
  }
}

//third dark blue line
void thirdDarkBlueLines(int h, int hs) {
  stroke(48, 101, 172);
  while (h < width+120) {
    line(830, h+160+a, 900, h-220+a);
    h=h+hs;
    a=a+0.1;
    if (a < 0) { 
    a = height;
    }
  }
}

//third grey line
void thirdGreyLines(int h, int hs) {
  stroke(174, 198, 207);
  while (h < width+120) {
    line(900, h-220+a, 0, h-80+a);
    h=h+hs;
    a=a+3;
  }
}

//HORIZONTAL DIRECTION
//These are the three lines that make up the background
//first horizontal line
void horizontalLightBlueLines(int v, int vs){
  stroke(119, 158, 203, 80);
  while (v < height+250) {
    line(v+a, 0, v+350+a, 250);
    v=v+vs;
    a=a-0.1;
  }
}

//second horizontal line
void horizontalDarkBlueLines(int v, int vs){
  stroke(119, 158, 203, 170);
  while (v < height+250) {
    line(v+350+a, 250, v-30+a, 560);
    v=v+vs;
    a=a-0.5;
  }
}

//third horizontal line
void horizontalGreyLines(int v, int vs){
  stroke(119, 158, 203, 40);
  while (v < height+250) {
    line(v-30+a, 560, v+120+a, 650);
    v=v+vs;
    a=a-0.5;
  }
}
