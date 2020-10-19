## Midterm Project: Bouncing ball

### 1. Overwiew
To be reviewed.

### 2. Process

#### Step 1: Creation of sliders and concept of the game

The initial idea was to create a simple game in which the ball bounces off the walls or a mouse controlled slider. I believe there is something magical about simplicity, and it is the simplest, age-old games like snake that are often seen as some of the most entertaining. After creating the first slider, I began to wonder why the user would wait for the ball to bounce off the walls three more times before hitting the slider again. So I decided to add four mouse-controlled sliders on each wall.

This very early stage of the game is based on the four if statements.

````
  if (xpos < (25+30) && (mouseY>ypos-50 && mouseY<ypos+50)) {
    xspeed = -xspeed;
  }
  if (xpos > width-(25+30) && (mouseY>ypos-50 && mouseY<ypos+50)) {
    xspeed = -xspeed;
  }
  if (ypos > height-(25+30) && (mouseX>xpos-50 && mouseX<xpos+50)) {
    yspeed = -yspeed;
  }
  if (ypos < (25+30) && (mouseX>xpos-50 && mouseX<xpos+50)) {
    yspeed = -yspeed;
  }
````

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/1.png" height="200"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/2.png" height="200"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/3.png" height="200">


### Step 2: Game start implementation, signifiers, background
The game phase begins when the user presses any key on the keyboard. Then the speed changes from 0 to a specific value, the ball starts to move on the screen. To make the game more understandable for the user, I created simple signifiers in Photoshop that will be displayed at the very beginning. To make the game look more visually appealing, I used [this](https://comidoc.net/static/assets/thumbs/750/1270990_0734_34.jpg) google image as the background. I also replaced a white elipse with the extracted `bird` from this image.

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/4.png" height="300"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/6.png" height="300"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/5.png" height="300">

### Step 3: Displaying score
The score counter in my game partially consists of joined picture and text. I prefered the handwritten score sign, so I loaded a picture `img_score = loadImage("score.png");`. Nextly I defined a `score` variable, which increases every time bird hits the slider.

```
  image(img_score, 40, 760, 100, 30);
  fill(255);
  textSize(38);
  text(score, 145, 786);
````

### Step 4: Incorporating sound
I imported the `Keyboard` library from the` Soundfile` and used it to add sound to my game. I created a board of four votes. Each time the bird hits the slider, a sound will be played.

````
void updateRight() {
  if (xpos > width-(50+30) && (mouseY>ypos && mouseY<ypos+50)) {
    xspeed = -xspeed;
    file[1].play(0.5, 1.0);
    score += 1;
  }
}
````

### Step 5: Restart
I created a `void restart ()` with an if statement ʻif (ypos <0 || xpos <0 || xpos> width || ypos> height) `. Every time the bird flies over the canvas, the x and y speed is 0 and the bird returns to its original position. What's more, in Photoshop I prepared two more graphics: `game over` and ʻit's a highscore`. Then I defined more variables in my code so that the appropriate picture is displayed, the instructions are displayed at the very beginning and a "game over" sign is displayed after each loss. 

````
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
````
````
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
````
<img src="https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/7.png" height="300"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/8.png" height="300">
