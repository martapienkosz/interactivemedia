## Classes
### This is a simple work of art

### 1. Final work
Please have a look at my final animation. 

![alt-text](https://github.com/martapienkosz/interactivemedia/blob/master/Media/movingGridClass.gif, width="200")

Below I describe the process of creating it.

### 1. Vertically moving lines
Based on the `movingCircle` program, which we discussed in class, I created very simple animation of vertically moving lines on a black background. Once the line touches the edge of canvas, it changes direction. Here is the code:

````
int a=15;

class Line { 
  float ypos, speedH;
  Line (float y, float sH) { 
    ypos = y; 
    speedH = sH;
  } 

  void updateH() { 
    ypos += speedH; 
    if (ypos > height || ypos < 0) { 
      speedH = -speedH;
    }
  }

  void drawLineH() {
    stroke(255);
    line(0, ypos, width, ypos);
  }
} 


Line[] myArray = new Line[16];

void setup() {
  size(900, 1000);
  frameRate(30);

  for (int i=0; i < myArray.length; i++) {
    myArray[i] = new Line(random(a), random(a));
  }
}
void draw() { 
  background(50);

  for (int i=0; i < myArray.length; i++) {
    myArray[i].updateH();
    myArray[i].drawLineH();
}
}
````

### 2. A grid of moving lines
Later I have decided to add also horizontally moving lines. I had to define two more variables (`x` and `sV`) as well as create two more functions (`updateV` and `drawLineV`). At this point, I started to wonder what if I wanted a different number of lines for each direction? I tried inserting a new constructor and a second array but it didn't work as I wanted. Maybe I should just create a new class ...

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/Moving_grid1.png" width="200"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/Moving_grid2.png" width="200"> 

This is part of the code:
````
int a=15;

class Line { 
  float xpos, speedV, ypos, speedH;
  Line (float y, float sH, float x, float sV) { 
    ypos = y; 
    speedH = sH;
    xpos = x; 
    speedV = sV;
  } 

  void updateH() { 
    ypos += speedH; 
    if (ypos > height || ypos < 0) { 
      speedH = -speedH;
    }
  }

  void drawLineH() {
    stroke (255);
    line(0, ypos, width, ypos);
  }
  void updateV() { 
    xpos += speedV; 
    if (xpos > width || xpos < 0) { 
      speedV = -speedV;
    }
  }
  void drawLineV() {
    stroke (255);
    line(xpos, 0, xpos, height);
  }
} 


Line[] myArray = new Line[16];

void setup() {
  size(900, 1000);
  frameRate(30);

  for (int i=0; i < myArray.length; i++) {
    myArray[i] = new Line(random(a), random(a), random(a), random(a));
  }
}
void draw() { 
  background(50);

  for (int i=0; i < myArray.length; i++) {
    myArray[i].updateH();
    myArray[i].drawLineH();
    myArray[i].updateV();
    myArray[i].drawLineV();
  }
}

````
### 3. Changing weight, color and opacity:
My next step was to make `strokeWeight` and `stroke` random for every line. I have incorporated new variables to `update` function, so that every time the line hits the edge of canvas the weight, color and opacity changes.
````
class Line { 
  float xpos, speedV, ypos, speedH, w, o, r, g, b;
  Line (float y, float sH, float x, float sV) { 
    ypos = y; 
    speedH = sH;
    xpos = x; 
    speedV = sV;
  } 

  void updateH() { 
    ypos += speedH; 
    if (ypos > height || ypos < 0) { 
      speedH = -speedH +random(-15, 5);
      w= random(2, 30);
      o=random(50, 200);
      r= random (100, 200);
      g=random(100, 200);
      b=random(100, 200);
    }
  }
  
    void drawLineH() {
    strokeWeight(w);
    stroke(r, g, b, o);
    line(0, ypos, width, ypos);
  }
````
### 4. Changing speed
Nextly I added the `random(5)` component so that every time the ball hits the edge of canvas, its speed changes slightly.

````
    if (xpos > width || xpos < 0) { 
      speedV = -speedV +random(5);
      }
````

### 5. Changing background to white:
At the very end I decided to do one more change. I have incorporated `mousePressed` function to the `void draw()`.

````
void draw() { 
  background(50);
 if (mousePressed == true) {
    background (255);
  } else {
    background(50);
  }
  for (int i=0; i < myArray.length; i++) {
    myArray[i].updateH();
    myArray[i].drawLineH();
    myArray[i].updateV();
    myArray[i].drawLineV();
  }
}

````

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/colorful_grid1.png" width="200"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/colorful_grid2.png" width="200"> 

