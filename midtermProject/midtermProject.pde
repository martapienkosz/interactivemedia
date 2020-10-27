//Midterm Project: Bouncing Ball
//Marta Pienkosz, due October 27
//Don't let the ball touch the wall. The game comes with all the necessary instructions, so hit play and enjoy.

import processing.sound.*;
SoundFile[] file;
int numsounds = 4;
boolean start = true;
int character = 0;


PImage img_instructions;
PImage img_background;
PImage img_choosecharacter;
PImage img_mario;
PImage img_dragon;
PImage img_mushroom;
PImage img_superhero;
PImage img_changecharacter;
PImage img_score;
PImage img_highscore;
PImage img_gameover;
float xpos, ypos;  

float xspeed = 0;
float yspeed = 0;

int cnt = 0;
int score = 0;
int highscore = 0;
int hs = 0;

void setup() 
{
  size(800, 800);

  file = new SoundFile[numsounds];
  for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, (i+1) + ".aif");
  }

  img_choosecharacter = loadImage("choosecharacter.png");
  img_instructions = loadImage("sub.png");
  img_background = loadImage("background.png");

  img_mushroom = loadImage("mushroom.png");
  img_dragon = loadImage("dragon.png");
  img_mario = loadImage("mario.png");
  img_superhero = loadImage("superhero.png");
  img_changecharacter = loadImage("changecharacter.png"); 

  img_score = loadImage("score.png");
  img_highscore = loadImage("highscore.png");
  img_gameover = loadImage("gameover.png");

  xpos = width/3;
  ypos = height/2;
}

void draw() {
  choose_character();

  startGame();
  instructions();

  shapes();
  updateRight();
  updateLeft();
  updateBottom();
  updateUp();
  restart();

  xpos = xpos + xspeed;
  ypos = ypos + yspeed;

  //saveFrame("######.png");
}

void mousePressed() {
  if (mouseX>0 && mouseX<250 && mouseY>200 && mouseY<450) {
    character = 1;
    start = false;
  }
  if (mouseX>260 && mouseX<460 && mouseY>500 && mouseY<700) {
    character = 2;
    start = false;
  }
  if (mouseX>470 && mouseX<670 && mouseY>330 && mouseY<530) {
    character = 3;
    start = false;
  }
  if (mouseX>570 && mouseX<770 && mouseY>600 && mouseY<800) {
    character = 4;
    start = false;
  }
  if (mouseX>530 && mouseX<620 && mouseY>490 && mouseY<580) {
    character = 0;
    start = true;
  }
}

void choose_character() {
  if (start == true) {
    image(img_choosecharacter, 0, 0, 800, 800);
  }
}

void instructions() {
  if (start == false) {
    image(img_background, 0, 0, 800, 800);
    image(img_score, 40, 760, 100, 30);
    fill(255);
    textSize(38);
    text(score, 145, 786);

    if (xspeed == 0 && start == false) {
      if (cnt == 0) {
        image(img_instructions, 0, 0, 800, 800);
      }
      if (cnt == 10) {
        image(img_gameover, 155, 480, 340, 150);
        image(img_changecharacter, 530,400,220,180);
      }
      if (hs == 1) {
        image(img_highscore, 290, 320, 370, 90);
      }
    }
  }
}

void startGame() {
  if (keyPressed) {
    xspeed = 9; 
    yspeed = 12;
    score = 0;
    hs = 0;
  }
}

void shapes() {
  if (start == false) {
    noStroke();
    fill(255, 226, 61);

    if (character == 1) {
      image(img_mario, xpos, ypos, 50, 50);
    }

    if (character == 2) {
      image(img_mushroom, xpos, ypos, 50, 50);
    }

    if (character == 3) {
      image(img_superhero, xpos, ypos, 50, 50);
    }

    if (character == 4) {
      image(img_dragon, xpos, ypos, 50, 50);
    }

    fill(14, 48, 47);
    rect(mouseX-50, height-30, 100, 30);
    rect(width-30, mouseY-50, 30, 100);
    rect(mouseX-50, 0, 100, 30);
    rect(0, mouseY-50, 30, 100);
  }
}

void updateLeft() {
  if (xpos < 30 && (mouseY>ypos && mouseY<ypos+50)) {
    xspeed = -xspeed;
    file[0].play(0.5, 1.0);
    score += 1;
  }
}

void updateRight() {
  if (xpos > width-(50+30) && (mouseY>ypos && mouseY<ypos+50)) {
    xspeed = -xspeed;
    file[1].play(0.5, 1.0);
    score += 1;
  }
}

void updateBottom() {
  if (ypos > height-(50+30) && (mouseX>xpos && mouseX<xpos+50)) {
    yspeed = -yspeed;
    file[2].play(0.5, 1.0);
    score += 1;
  }
}

void updateUp() {
  if (ypos < 30 && (mouseX>xpos && mouseX<xpos+50)) {
    yspeed = -yspeed;
    yspeed += 0.5;
    xspeed += 0.5;
    file[3].play(0.5, 1.0);
    score += 1;
  }
}

void restart() {
  if (ypos < 0 || xpos < 0 || xpos > width || ypos >height) {
    xspeed = 0;
    yspeed = 0;
    xpos = width/3;
    ypos = height/2;
    cnt = 10;
    if (score > highscore) {
      highscore = score;
      hs = 1;
    }
  }
}
