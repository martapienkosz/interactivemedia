## Midterm Project: Bouncing ball

### 1. Overwiew
To be reviewed.

### 2. Challanges

### 3. Process

#### Stage 1: Creation of sliders and implementation of the concept of the game

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
