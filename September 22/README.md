## Animation, Conditionals, Loops
### This is a simple work of art

### 1. Idea
The main idea behind this project was to create an allusion of depth on a 2D screen. I tried to manipulate lines and colors to create cubic structures. 
I'm not very familiar with rgb palettes so decided to google some interesting pastel colors in shades of blue.


<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/blue.png" width="200">
<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/grey.png" width="200">
<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/dark%20blue.png" width="200">

### 2. Execution
Just like in the lesson, I decided to create a grid of lines using the function `while ()`. I wanted the lines at an angle, so the values of x and y didn't stay constant. 
To keep the line continuous, I carefully sellected x1 and y1 at the ends of the previous line, ie. x2 and y2. 

This is part of the code:
````
//first blue line
void vLine1(int h, int hs) {
  stroke(119, 158, 203);
  while (h < width+80) {
    line(0, h-80, 230, h);
    h=h+hs;
  }
}

//first dark blue line
void vLine2(int h, int hs) {
  stroke(48, 101, 172);
  while (h < width+120) {
    line(230, h, 400, h-520);
    h=h+hs;
  }
}

````


````
void setup() {
  size(900, 900);
  background(255);
  frameRate(8);
}

float a;

void draw () {
  line(200, 0, 200, 80-a);
  a=a-10;
}

````

![tekst alternatywny](url grafiki)
