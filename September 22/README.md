### Animation, Conditionals, Loops
## This is a simple work of art


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
