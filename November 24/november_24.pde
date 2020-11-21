import processing.serial.*;
Serial myPort;

//starting position of the ball
float xpos, ypos;

//correspond to successive checkpoints
int one, two, three = 0;
PImage img_background;

void setup() {
  size(640, 640);
  img_background = loadImage("background.png");

  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');

  // draw with smooth edges
  smooth();
}

void draw() {
  image(img_background, 0, 0, 640, 640);
  noStroke();
  fill(255);
  //draws four rectangles known as 'checkpoints'
  rect(530, 40, 70, 50);
  rect(150, 250, 70, 50);
  rect(400, 350, 70, 50);
  rect(40, 550, 70, 50);

  fill(255, 0, 255);
  ellipse(xpos, ypos, 20, 20);
}


void serialEvent(Serial myPort) {
  // read the serial buffer:
  String myString = myPort.readStringUntil('\n');
  myString = trim(myString);

  // split the string at the commas and convert the sections into integers
  int sensors[] = int(split(myString, ','));

  for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
    print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
  }

  println();
  if (sensors.length > 1) {
    xpos = map(sensors[0], 0, 30, 0, width);
    ypos = map(sensors[1], 0, 1023, 0, height);
  }

  // each time the ball touches a rectangle the diode turns on a specific color
  if (xpos> 530 && xpos<600 && ypos>40 && ypos<90) {
    myPort.write('R');
    one = 1;
  }
  if (one == 1 && xpos> 150 && xpos<220 && ypos>250 && ypos<300) {
    myPort.write('C');
    two = 1;
  }
  if (two == 1 && xpos> 400 && xpos<470 && ypos>350 && ypos<400) {
    myPort.write('M');
    three = 1;
  }
  // Once all checkpoints have been captured, the blue LED will turn on, signifying the end of the game
  if (three ==1 && xpos> 40 && xpos<110 && ypos>550 && ypos<600) {
    myPort.write('B');
  } else {
    myPort.write('W');
  }
}
