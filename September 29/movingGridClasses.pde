int a=15;

class Line { 
  float xpos, speedV, ypos, speedH, w, o, r, g, b;
  Line (float y, float sH, float x, float sV) { 
    ypos = y; 
    speedH = sH;
    xpos = x; 
    speedV = sV;
  } 
  //Here are all paramiters that change everytime line hits the edge of canvas
  void updateH() { 
    ypos += speedH; 
    if (ypos > height || ypos < 0) { 
      //The line changes direction when hits the edge of the canvas, aditionally speed varies for each line
      speedH = -speedH +random(-5, 5);
      //Those are the defined variables for changing weight, color, opacity
      w= random(2, 30);
      o=random(50, 200);
      r= random (100, 200);
      g=random(100, 200);
      b=random(100, 200);
    }
  }
  //This function draws horizonal lines
  void drawLineH() {
    strokeWeight(w);
    stroke(r, g, b, o);
    line(0, ypos, width, ypos);
  }
  // The same is being done for vertical lines
  void updateV() { 
    xpos += speedV; 
    if (xpos > width || xpos < 0) { 
      //The line changes direction when hits the edge of the canvas, aditionally speed varies for each line
      speedV = -speedV +random(-5, 5);
      //Those are the defined variables for changing weight, color, opacityT
      w=random(2, 30);
      o=random(50, 255);
      r= random (100, 200);
      g=random(100, 200);
      b=random(100, 200);
    }
  }
  //This function draws vertical lines
  void drawLineV() {
    strokeWeight(w);
    stroke(r, g, b, o);
    line(xpos, 0, xpos, height);
  }
} 

// 16 lines are drawn
Line[] myArray = new Line[16];

void setup() {
  size(900, 1000);
  frameRate(30);
  //Line has four paramiters defined by floats, see line 5 of the code
  for (int i=0; i < myArray.length; i++) {
    myArray[i] = new Line(random(a), random(a), random(a), random(a));
  }
}
void draw() { 
  background(50);
  //Background changes into white once mouse is pressed
  if (mousePressed == true) {
    background (255);
  } else {
    background(0);
  }
  for (int i=0; i < myArray.length; i++) {
    myArray[i].updateH();
    myArray[i].drawLineH();
    myArray[i].updateV();
    myArray[i].drawLineV();
  }
  //This function was used to save frames and create gif video for the github
  //saveFrame("gif_####.png");
}
