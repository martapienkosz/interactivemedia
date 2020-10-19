import processing.sound.*;
SoundFile[] file;
int numsounds = 4;

PImage img_instructions;
PImage img_background;
PImage img_ball;
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

  img_instructions = loadImage("sub.png");
  img_background = loadImage("background.png");
  img_ball = loadImage("ball.png");
  img_score = loadImage("score.png");
  img_highscore = loadImage("highscore.png");
  img_gameover = loadImage("gameover.png");

  xpos = width/3;
  ypos = height/2;
}

void draw() {
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

void instructions() {
  image(img_background, 0, 0, 800, 800);
  image(img_score, 40, 760, 100, 30);
  fill(255);
  textSize(38);
  text(score, 145, 786);

  if (xspeed == 0) {
    if (cnt == 0) {
      image(img_instructions, 0, 0, 800, 800);
    }
    if (cnt == 10) {
      image(img_gameover, 155, 480, 340, 150);
    }
    if (hs == 1) {
      image(img_highscore, 290, 320, 370, 90);
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
  noStroke();
  fill(255, 226, 61);
  image(img_ball, xpos, ypos, 50, 50);

  fill(14, 48, 47);
  rect(mouseX-50, height-30, 100, 30);
  rect(width-30, mouseY-50, 30, 100);
  rect(mouseX-50, 0, 100, 30);
  rect(0, mouseY-50, 30, 100);
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
