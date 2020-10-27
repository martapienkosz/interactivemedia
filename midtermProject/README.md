## Midterm Project: Bouncing ball

## 1. Description
For this midterm project, I decided to create a simple game in which the ball bounces off the mouse controlled slider and cannot hit the wall. I believe there is something magical about simplicity, and it is the simplest, age-old games like snake that are often seen as some of the most entertaining.

Check the preview below:

![alt-text](https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/MidTermVidShort.gif)

Or have a look at the finalized version of the game phase [video](https://youtu.be/9hIf1NkiTdU).


## Step 1: Creation of sliders and concept of the game

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



## Step 2: Game start implementation, signifiers, background
The game phase begins when the user presses any key on the keyboard. Then the speed changes from 0 to a specific value, the ball starts to move on the screen. To make the game more understandable for the user, I created simple signifiers in Photoshop that will be displayed at the very beginning. To make the game look more visually appealing, I used [this](https://comidoc.net/static/assets/thumbs/750/1270990_0734_34.jpg) google image as the background. I also replaced a white elipse with the extracted `bird` from this image.

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/4.png" height="300"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/5.png" height="300">



## Step 3: Displaying score
The score counter in my game partially consists of joined picture and text. I prefered the handwritten score sign, so I loaded a picture `img_score = loadImage("score.png");`. Nextly I defined a `score` variable, which increases every time bird hits the slider.

```
  image(img_score, 40, 760, 100, 30);
  fill(255);
  textSize(38);
  text(score, 145, 786);
````



## Step 4: Incorporating sound
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



## Step 5: Restart
I created a `void restart ()` with an if statement `if (ypos <0 || xpos <0 || xpos> width || ypos> height)`. Every time the bird flies over the canvas, the x and y speed is 0 and the bird returns to its original position. What's more, in Photoshop I prepared two more graphics: `game over` and  `it's a highscore`. Then I defined more variables in my code so that the appropriate picture is displayed, the instructions are displayed at the very beginning and a "game over" sign is displayed after each loss. 

````
if (xspeed == 0) {
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
````

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/7.png" height="260"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/8.png" height="260"> ![alt-text](https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/midtermProject.gif)



## Step 6: Revise project
This is a finalised version of a game phase

![alt-text](https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/midtermProject.gif)

**Developments**: Could a player choose a character at the very begining?



## Step 7: Choose a character to play with
To create a screen with the option to choose character, I needed to find an interesting [background](https://cdn.gamedevmarket.net/wp-content/uploads/20191203194140/a07df83365da6ca90f635c0ba20bb6f8f3e958af.jpg) and graphics with [characters](https://pl.pinterest.com/pin/688839705474821810/). Then, in Photoshop, I added signifiers and cropped individual characters from a merged graphic. In this way I have create a separate graphic with reference for each. It was very important that the dimensions of the characters were square so that the code would work regardless user selection. At this point I had to improvise a little and redraw the figure of the mushroom by hand.

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/9.png" height="300"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/10.png" height="300">



## Step 8: Initiating character selection
In the function `void MousePressed`, I have added some if statements so that you can select a character by clicking on it. I also assigned the value "false" to the variable "start". This allowed the game instructions o be displayed as soon as the character has been selected.

````
void mousePressed() {
  if (mouseX>0 && mouseX<250 && mouseY>200 && mouseY<450) {
    character = 1;
    start = false;
  }
````
  
````
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
 ````



## Step 9: Reseting the character
Finally, in Photoshop create another graphic signifing where to click to go back to the character selection screen. This way after loosing a game player can choose another character and start again. Of course, user can as well press any key to start again without a need for selection.

````
  if (mouseX>530 && mouseX<620 && mouseY>490 && mouseY<580) {
    character = 0;
    start = true;
  }
````

![alt-text](https://github.com/martapienkosz/interactivemedia/blob/master/midtermProject/Media/VidChar.gif)


## Conclusion
  
