## Final Project
### Follow the line

## Idea
For my final project, I plan to extend the idea behind the "follow the line" game. I started working on it as part of the project on [November 24th](https://drive.google.com/file/d/1NHkftkh1YBJvv7NzOJ9rMNpQoOk1TNax/view?usp=sharing) and I think it is interesting enough to be the basis of my final project. I indend to follow the general concept, but would like to add several levels, enrich the visual aestethic and make it a game with a clear start and end.

## Sketches
<img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/finalproject_sketch.png" width= "1100">

## Monday 11/30
As the first, I decided to program the levels of the game. Instead of strictly placing rectangles (checkpoints), I wanted them to be randomly arranged on the screen. Each time the user passes the level, the placement of the four checkpoints should change.

For this, I created a function `draw Numbers ()` which selects random x and y positions for each control point. It is only called when `newNumber == 1`, i.e. when all the checkpoints at the specified level have been collected.

````
void drawNumbers() {
  if (newNumber == 1) {
    x1 = random(70, 570);
    .
    .
    
void newLevel() {
  drawNumbers();
  ellipse(x1, y1, 30, 30);
````

I also took into account the collisions between the checkpoint and the main sphere controlled by the sensor. Each checkpoint obtained will light a yellow LED.

````
  if (xpos > (x1-15) && xpos < (x1+15) && ypos > (y1-15) && ypos < (y1+15)) {
    myPort.write('Y');
  }
````
