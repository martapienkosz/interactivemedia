# Final Project: Cherry-man

## Idea
For my final project, I plan to extend the idea behind the "follow the line" game. I started working on it as part of the project on [November 24th](https://drive.google.com/file/d/1NHkftkh1YBJvv7NzOJ9rMNpQoOk1TNax/view?usp=sharing) and I think it is interesting enough to be the basis of my final project. I indend to follow the general concept, but would like to add several levels, enrich the visual aestethic and make it a game with a clear start and end.

<img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/finalproject_sketch.png" width= "1100">

## Monday, November 30
As the first, I decided to program the levels of the game. Instead of strictly placing rectangles (checkpoints), I wanted them to be randomly arranged on the screen. Each time the user passes the level, the placement of the four checkpoints should change.

For this, I created a function `draw Numbers ()` which selects random x and y positions for each control point. It is only called when `newNumber == 1`, i.e. when all the checkpoints at the specified level have been collected.

````
void newLevel() {
  if (newNumber == 1) {
    for (int i=0; i < 8; i++) {
      x[i] = random(70, 560);
    .
    .
    
void objects() {
  newLevel();
  image(cherry, x[0], x[4], 30, 30);
  }
````

<img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr1.jpg" height= "300"> <img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr2.png" height= "300">

I also took into account the collisions between the checkpoint and the main sphere controlled by the sensor. Each checkpoint obtained will light a yellow LED.

````
if (xpos > x[0] && xpos < (x[0]+30) && ypos > x[4] && ypos < (x[4]+30)) {
  myPort.write('Y');
  value[0] = 1;
}
````

Ultimately I decided to create the impression of collecting checkpoints by making them disappear. A `value[0] == 1` means there is a collision between the main ball and the control point.

````
void objects() {
  newLevel();
  if (value[0] == 0) { 
    image(cherry, x[0], x[4], 30, 30);
  }
````


## Tuesday, December 1
To increase the difficulty of the game, I decided to introduce ghost objects. They will move around the screen and reset the score in case of collision with the main ball. To indicate a collision, the LED will turn red. I plan to initiate more ghosts as the game level rises.

````
void ghosts() {
  image(ghost1, xposGhost[0], yposGhost[0], 20, 20);
  if (yposGhost[0] < 53 || yposGhost[0] > 567) {
    speed[0] = -speed[0];
  }
```` 

Checking for a collision and sending a signal back to arduino.

````
if (xpos > xposGhost[0] && xpos < (xposGhost[0] + 20)) {
  if (ypos > yposGhost[0] && ypos < (yposGhost[0] + 20)) {
  myPort.write('R');
}
````


## Wednesday, December 2
After initiating one ghost I decided it would be great to have more ghosts as the user progressed through the game. I tried to use the following code but the ghost never appeared.

````
 if (score > 1) {
    image(ghost2, xposGhost[1], yposGhost[1], 20, 20);
    if (xposGhost[1] < 53 || xposGhost[1] > 567) {
      speed[1] = -speed[1];
    }
  }
````

Ultimately, I decided to create an array `int [] speed = {1, 0, 0, 0, 0}` that will store the speeds and initialize all 5 spirits at the very beginning. With each point won, the speed of each ghost increases slightly, so that after a while the game becomes very challenging. It doesn't work perfectly either, because sometimes 4 ghosts move and after a while only 2. I will try to solve this problem in the coming days

````
score ++;
if (score > 2) { 
  speed[2] += 2;
}
if (score > 3) {
  speed[3] += 1;
}
````

Ultimately I decided to add a side switch so that the LED and sensors would not light up the entire time the arduino is plugged in.

````
void loop() {
  if (digitalRead(8) == HIGH) {
````


## Thursday, December 3
I decided to deviate from my original idea of "follow the line" Game and create something similar to a packman. I found the appropriate graphics on the internet, and then in Photoshop I separated the elements, created a board background, a score counter.

<img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr3.png" height= "350"> <img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr9.png" height= "350"> <img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr6.png" height= "350">

I also created a starting page with basic information about using sensors and the goal of the game. User can acess it all the time by clicking at the intsrucion sign.

````
if (keyPressed) {
  intro = 0;
}

if (intro == 1) {
  image(instructions, 0, 0, 640, 640);
}
  .
  .
void mousePressed() {
  if (mouseX > 480 && mouseX < 600 && mouseY > 600 && mouseY < 620) {
    intro = 1;
  }
}
````


## Friday, December 4
I have created a life list that stores information on how many times there has been a collision between spirit and pacman. Packman has three lives, after which a gameover sign appears. Clicking somewhere on the screen displayes main menu, so that user can play once again. Additionally, the LED turns red when the game end panel is displayed.

````
if (life[0] + life[1] + life[2] + life[3] + life[4] == 3) {
    intro = 1;
    if (mouseX > 0 && mouseX < 640 && mouseY > 0 && mouseY < 640) {
      score = -1;
      newNumber = 1;
      for (int i=0; i < 5; i++) {
        life[i] = 0;
````

I also wanted to signify how many lives were left. In the right corner I put the icons of the dead ghosts which are displayed respectively when the packman loses one life.

````
void gameOver() {
  if (life[0] + life[1] + life[2] + life[3] + life[4] == 0) {
    fill(0);
    rect(522, 9, 70, 30);
  }

  if (life[0] + life[1] + life[2] + life[3] + life[4] == 1) {
    fill(0);
    rect(522, 9, 35, 30);
  }
````

<img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr7.png" height= "400"> <img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr8.png" height= "400"> 

## Saturday, 
Averaging the sensor

## creating walls
