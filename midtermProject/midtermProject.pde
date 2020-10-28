//Midterm Project: Bouncing Ball
//Marta Pienkosz, due October 27
//Don't let the ball touch the wall. The game comes with all the necessary instructions, so hit play and enjoy.

//importing keyboard Soundfile library
import processing.sound.*;
SoundFile[] file;
int numsounds = 4;

//loading all images
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

//setting variables necessary to display right texts, images and to reset the game
int cnt = 0;
int score = 0;
int highscore = 0;
int hs = 0;
boolean start = true;
int character = 0;

void setup() 
{
  size(800, 800);
  //creating a class of 4 songs
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

  //setting an initial position of a character (i.e. ball)
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

  //updating the position of character
  xpos = xpos + xspeed;
  ypos = ypos + yspeed;

  //saveFrame("######.png");
}

//creating areas that the player can click to select a character,
//start = false displays instructions, start = true displays the
//character selection screen
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

//start = true displays the character selection screen
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
      //displaying instructions when user first enters the game phase
      if (cnt == 0) {
        image(img_instructions, 0, 0, 800, 800);
      }
      //displaying 'game over' sign and option to change the character
      if (cnt == 10) {
        image(img_gameover, 155, 480, 340, 150);
        image(img_changecharacter, 530, 400, 220, 180);
      }
      //displaying highscore, score is being compared in other function
      if (hs == 1) {
        image(img_highscore, 290, 320, 370, 90);
      }
    }
  }
}

//pressing any key changes the speed from 0
void startGame() {
  if (keyPressed) {
    xspeed = 9; 
    yspeed = 12;

    //The score and the hs variables are reset
    //every time new game starts
    score = 0;
    hs = 0;
  }
}

void shapes() {
  if (start == false) {
    noStroke();
    fill(255, 226, 61);

    //mousePressed() function sets character varaible to either 1, 2, 3, 4.
    //This function displays a correct character to play with
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

    //printing moving sliders in the right positions
    fill(14, 48, 47);
    rect(mouseX-50, height-30, 100, 30);
    rect(width-30, mouseY-50, 30, 100);
    rect(mouseX-50, 0, 100, 30);
    rect(0, mouseY-50, 30, 100);
  }
}

//when the ball hits the slider, the score increases by 1,
//the direction changes and a song is played
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

//additionally, the speed increases slightly with every fourth hit
void updateUp() {
  if (ypos < 30 && (mouseX>xpos && mouseX<xpos+50)) {
    yspeed = -yspeed;
    yspeed += 0.5;
    xspeed += 0.5;
    file[3].play(0.5, 1.0);
    score += 1;
  }
}

//when the ball is not hit by the slider, the game is over.
//The position of the ball changes to its initial position
//and the speed is set to 0
void restart() {
  if (ypos < 0 || xpos < 0 || xpos > width || ypos >height) {
    xspeed = 0;
    yspeed = 0;
    xpos = width/3;
    ypos = height/2;

    //when cnt = 10, i.e. every time the user loses, the
    //"game over" sign is displayed and the character can be changed
    cnt = 10;
    if (score > highscore) {
      //assigning new value to highscore
      highscore = score;
      //when hs =1, the highscore sign is being displayed
      hs = 1;
    }
  }
}
