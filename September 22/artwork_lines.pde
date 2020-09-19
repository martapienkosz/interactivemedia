void setup() {
  size(900, 900);
  background(255);
  frameRate(3);
}

float a;

void draw () {
  vLine1(0, 50);
  vLine2(0, 50);
  vLine3(0, 50);
  vLine4(0, 50);
  vLine5(0, 50);
  vLine6(0, 50);
  vLine7(0, 50);
  vLine8(0, 50);
  vLine9(0, 50);
  hLine1(0, 50);
  hLine2(0, 50);
  hLine3(0, 50);
}

//VERTICAL DIRECTION
//These are the three lines that make up the first rectangle
//first blue line
void vLine1(int h, int hs) {
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
void vLine2(int h, int hs) {
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
void vLine3(int h, int hs) {
  stroke(174, 198, 207);
  while (h < width+120) {
    line(400, h-520+a, 170, h+a);
    h=h+hs;
    a=a-0.1;
  }
}
//These are the three lines that make up the second rectangle
//second blue line
void vLine4(int h, int hs) {
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
void vLine5(int h, int hs) {
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
void vLine6(int h, int hs) {
  stroke(174, 198, 207);
  while (h < width+120) {
    line(600, h+20+a, 370, h+80+a);
    h=h+hs;
    a=a-3;
  }
}

//These are the three lines that make up the third rectangle
//third blue line
void vLine7(int h, int hs) {
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
void vLine8(int h, int hs) {
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
void vLine9(int h, int hs) {
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
void hLine1(int v, int vs){
  stroke(119, 158, 203, 80);
  while (v < height+250) {
    line(v+a, 0, v+350+a, 250);
    v=v+vs;
    a=a-0.1;
  }
}

//second horizontal line
void hLine2(int v, int vs){
  stroke(119, 158, 203, 170);
  while (v < height+250) {
    line(v+350+a, 250, v-30+a, 560);
    v=v+vs;
    a=a-0.5;
  }
}

//third horizontal line
void hLine3(int v, int vs){
  stroke(119, 158, 203, 40);
  while (v < height+250) {
    line(v-30+a, 560, v+120+a, 650);
    v=v+vs;
    a=a-0.5;
  }
}
