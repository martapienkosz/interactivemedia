import processing.serial.*;
Serial myPort;

float xpos, ypos;
float previous_xpos, previous_ypos;

//starting position of the checkpoints
float[] posCherry = {0, 0, 0, 0, 0, 0, 0, 0 };

//starting positions and speeds of the ghosts
float[] xposGhost = {200, 300, 300, 100, 430};
float[] yposGhost = {200, 300, 550, 100, 430};
int[] speed = {1, 0, 0, 0, 0};

//stores information on values (checkpoints collected) and lifes
int[] value = {0, 0, 0, 0};
int[] life = {0, 0, 0, 0, 0};

int newNumber = 1;
int score = -1;
int intro = 1;
int step = 0;

PImage packman1;
PImage packman2;
PImage packman3;

PImage cherry;
PImage ghost1;
PImage ghost2;
PImage ghost3;
PImage ghost4;
PImage background;
PImage instructions;
PImage gameover;



void setup() {
  size(640, 640);

  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');

  // draw with smooth edges
  smooth();

  //load all necessary images
  background = loadImage("background.png");
  instructions = loadImage("instructions.png");
  gameover = loadImage("gameover.png");
  packman1 = loadImage("packman1.png");
  packman2 = loadImage("packman2.png");
  packman3 = loadImage("packman3.png");
  cherry = loadImage("cherry.png");
  ghost1 = loadImage("ghost1.png");
  ghost2 = loadImage("ghost2.png");
  ghost3 = loadImage("ghost3.png");
  ghost4 = loadImage("ghost4.png");
}


void draw() {
  basicSettings();
  objects();
  ghosts();
  gameOver();

  // update the position of the ghosts
  if (intro == 0) {
    yposGhost[0] += speed[0];
    xposGhost[1] += speed[1];
    yposGhost[2] += speed[2];
    xposGhost[3] += speed[3];
    xposGhost[4] += speed[4];
  }
  previous_xpos = xpos;
  previous_ypos = ypos;
}


void basicSettings() {
  image(background, 0, 0, 640, 640);

  // display score
  fill(254, 255, 168);
  textSize(20);
  text(score, 120, 28);

  // stop displaying instructions after user presses space
  if (keyPressed) {
    intro = 0;
  }

  if (intro == 1) {
    image(instructions, 0, 0, 640, 640);
  }
}


void gameOver() {
  // display black rectangles that cover images of dead ghosts each time packman looses a life 
  if (life[0] + life[1] + life[2] + life[3] + life[4] == 0) {
    fill(0);
    rect(522, 9, 70, 30);
  }

  if (life[0] + life[1] + life[2] + life[3] + life[4] == 1) {
    fill(0);
    rect(522, 9, 35, 30);
  }

  // when three lives are used up, the game over page is displayed
  if (life[0] + life[1] + life[2] + life[3] + life[4] == 3) {
    image(gameover, 0, 0, 640, 640);
    fill(255);
    textSize(25);
    text(score, 210, 263);
  }
}


void mousePressed() {
  // display page with instruction when the 'instuction' text is clicked
  if (mouseX > 480 && mouseX < 600 && mouseY > 600 && mouseY < 620) {
    intro = 1;
  }

  // reseting the game and deleating all information scored
  if (life[0] + life[1] + life[2] + life[3] + life[4] == 3) {
    intro = 1;
    if (mouseX > 0 && mouseX < 640 && mouseY > 0 && mouseY < 640) {
      score = -1;
      newNumber = 1;
      for (int i=0; i < 5; i++) {
        life[i] = 0;
      }
    }
  }
}


void newLevel() {
  if (newNumber == 1) {
    // randomly placing cherries
    for (int i=0; i < 8; i++) {
      posCherry[i] = random(70, 560);
    }
    for (int i=0; i < 4; i++) {
      value[i] = 0;
    }

    // changing the placement of the ghosts
    xposGhost[0] = random(90, 550);
    yposGhost[1] = random(90, 550);
    xposGhost[2] = random(90, 550);
    yposGhost[3] = random(90, 550);
    yposGhost[4] = random(90, 550);

    score ++;

    // increasing the speed of ghosts
    speed[0] += 1;
    speed[1] += 1;

    if (score > 2) { 
      speed[2] += 2;
    }
    if (score > 3) {
      speed[3] += 1;
    }
    if (score > 4) {
      speed[4] += 1;
    }
  }

  newNumber = 0;
}

void objects() {
  newLevel();
  if  (intro == 0 ) {
    // displaying key images
    if (frameCount%6==0) {
      step = (step+1) % 3;
    }
    if (step == 0) {
      image(packman1, xpos, ypos, 20, 20);
    }

    if (step == 1) {
      image(packman2, xpos, ypos, 20, 20);
    }

    if (step == 2) {
      image(packman3, xpos, ypos, 20, 20);
    }

    if (value[0] == 0) { 
      image(cherry, posCherry[0], posCherry[4], 30, 30);
    }
    if (value[1] == 0) {
      image(cherry, posCherry[1], posCherry[5], 30, 30);
    }
    if (value[2] == 0) {
      image(cherry, posCherry[2], posCherry[6], 30, 30);
    }
    if (value[3] == 0) {
      image(cherry, posCherry[3], posCherry[7], 30, 30);
    }
  }
}

void ghosts() {
  if (intro == 0) {
    // displaying ghosts and changing the direction of their movement
    image(ghost1, xposGhost[0], yposGhost[0], 20, 20);
    if (yposGhost[0] < 53 || yposGhost[0] > 567) {
      speed[0] = -speed[0];
    }
    image(ghost2, xposGhost[1], yposGhost[1], 20, 20);
    if (xposGhost[1] < 53 || xposGhost[1] > 567) {
      speed[1] = -speed[1];
    }
    image(ghost3, xposGhost[2], yposGhost[2], 20, 20);
    if (yposGhost[2] < 53 || yposGhost[2] > 567) {
      speed[2] = -speed[2];
    }
    image(ghost4, xposGhost[3], yposGhost[3], 20, 20);
    if (xposGhost[3] < 53 || xposGhost[3] > 567) {
      speed[3] = -speed[3];
    }
    image(ghost1, xposGhost[4], yposGhost[4], 20, 20);
    if (xposGhost[4] < 53 || xposGhost[4] > 567) {
      speed[4] = -speed[4];
    }
  }
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
    // maping sensors with the frame of the game
    //rect(50, 50, 542, 535);
    xpos = map(sensors[0], 0, 30, 20, 605);
    ypos = map(sensors[1], 0, 1023, 50, 565);
  }

  if (sensors[0] == 0) {
    intro = 1;
  }

  // each time the packman eats cherry the diode turns yellow, value array stores information on cherries collected
  if (xpos > posCherry[0] && xpos < (posCherry[0]+30) && ypos > posCherry[4] && ypos < (posCherry[4]+30)) {
    myPort.write('Y');
    value[0] = 1;
  }
  if (xpos > posCherry[1] && xpos < (posCherry[1]+30) && ypos > posCherry[5] && ypos < (posCherry[5]+30)) {
    myPort.write('Y');
    value[1] = 1;
  }
  if (xpos > posCherry[2] && xpos < (posCherry[2]+30) && ypos > posCherry[6] && ypos < (posCherry[6]+30)) {
    myPort.write('Y');
    value[2] = 1;
  }
  if (xpos > posCherry[3] && xpos < (posCherry[3]+30) && ypos > posCherry[7] && ypos < (posCherry[7]+30)) {
    myPort.write('Y');
    value[3] = 1;
  }
  if (xpos > xposGhost[0] && xpos < (xposGhost[0] + 20)) {
    if (ypos > yposGhost[0] && ypos < (yposGhost[0] + 20)) {
      myPort.write('R');
      life[0] = 1;
    }
  }

  // each time the packman collides with ghost the diode turns red, packman can lose three lifes
  if (xpos > xposGhost[1] && xpos < (xposGhost[1] + 20)) {
    if (ypos > yposGhost[1] && ypos < (yposGhost[1] + 20)) {
      myPort.write('R');
      life[1] = 1;
    }
  }
  if (xpos > xposGhost[2] && xpos < (xposGhost[2] + 20)) {
    if (ypos > yposGhost[2] && ypos < (yposGhost[2] + 20)) {
      myPort.write('R');
      life[2] = 1;
    }
  }
  if (xpos > xposGhost[3] && xpos < (xposGhost[3] + 20)) {
    if (ypos > yposGhost[3] && ypos < (yposGhost[3] + 20)) {
      myPort.write('R');
      life[3] = 1;
    }
  }
  if (xpos > xposGhost[4] && xpos < (xposGhost[4] + 20)) {
    if (ypos > yposGhost[4] && ypos < (yposGhost[4] + 20)) {
      myPort.write('R');
      life[4] = 1;
    }
  }

  //gameover, LED turns red for a long period of time
  if (life[0] + life[1] + life[2] + life[3] + life[4] == 3) {
    for (int i = 0; i<10; i++) {
      myPort.write('R');
    }
  }


  // Once all checkpoints have been captured, the blue LED will turn on, signifying the end of the game
  if (value[0] == 1 && value[1] == 1 && value[2] == 1 && value[3] == 1) {
    myPort.write('B');
    newNumber = 1;
  } else {
    myPort.write('W');
  }
}
