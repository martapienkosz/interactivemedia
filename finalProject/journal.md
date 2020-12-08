# Final Project: Cherry-man

## Idea
For my final project, I plan to extend the idea behind the "follow the line" game. I started working on it as part of the project on [November 24th](https://drive.google.com/file/d/1NHkftkh1YBJvv7NzOJ9rMNpQoOk1TNax/view?usp=sharing) and I think it is interesting enough to be the basis of my final project. I indend to follow the general concept, but would like to add several levels, enrich the visual aestethic and make it a game with a clear start and end.

The idea of the game is that the user controls the movement of the ball on the screen with two sensors. Its task is to follow the instructions on the screen to get the checkpoints and finaly change the color of LED to blue. Gaining a point is signified by changing the color of the LEDs from white. I used the readings from both of these sensors to control the ball x position (ultrasonic sensor) and y position(potentiometer).

<img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/finalproject_sketch.png" width= "1100">


## Sunday, November 29
### Sensors

I used following Arduino [tutorial](https://create.arduino.cc/projecthub/abdularbi17/ultrasonic-sensor-hc-sr04-with-arduino-tutorial-327ff6) to receive reading from the Utrasonic sensor. Nextly in procesing I maped those reading with the width of the screen xpos = map(sensors[0], 0, 30, 0, width).

  ````
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // activates the trigPin for 10 microseconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(30);
  digitalWrite(trigPin, LOW);
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
  distance = duration * 0.034 / 2; // Speed of sound wave divided by 2 (go and back)
  ````

Reading from a potentiometer is relatively easier to obtain. Similarly, I mapped the results ypos = map(sensors[1], 0, 1023, 0, height)
````
int secondSensor = analogRead(A1);
Serial.println(secondSensor);
````

I used [this](https://create.arduino.cc/projecthub/muhammad-aqib/arduino-rgb-led-tutorial-fc003e) tutorial to discover how to connect RGB LED. I have established communication between Processing and Arduino by using correspondingly myPort.write() and Serial.read() functions. The if statement was used to change the color of the LED every time the ball reaches the area of the white rectangle.

Processing:

````
if (xpos> 530 && xpos<600 && ypos>40 && ypos<90) {
  myPort.write('R');
  one = 1;
}
````

Arduino:

````
response = Serial.read();
if (response == 'R') {
  RGB_color(255, 255, 125); // Raspberry
}
````

## Monday, November 30
### Levels and checkpoints
As the first, I decided to program the levels of the game. Instead of strictly placing rectangles (checkpoints), I wanted them to be randomly arranged on the screen. Each time the user passes the level, the placement of the four checkpoints should change.


<img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr1.jpg" height= "300"> <img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr2.png" height= "300">


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


I also took into account the collisions between the checkpoint and the main sphere controlled by the sensor. Each checkpoint obtained will light a yellow LED.

````
if (xpos > x[0] && xpos < (x[0]+30) && ypos > x[4] && ypos < (x[4]+30)) {
  myPort.write('Y');
  value[0] = 1;
}
````

<img src= "https://github.com/martapienkosz/interactivemedia/blob/master/finalProject/data/packman.png" height= "75">  <img src= "https://github.com/martapienkosz/interactivemedia/blob/master/finalProject/data/cherry.png" height= "75"> 

Ultimately I decided to create the impression of collecting checkpoints by making them disappear. A `value[0] == 1` means there is a collision between the main ball and the control point.

````
void objects() {
  newLevel();
  if (value[0] == 0) { 
    image(cherry, x[0], x[4], 30, 30);
  }
````

![alt-text](https://github.com/martapienkosz/interactivemedia/blob/master/Media/gvideo4.gif)


## Tuesday, December 1
### Ghosts
To increase the difficulty of the game, I decided to introduce ghost objects. They will move around the screen and reset the score in case of collision with the main ball. To indicate a collision, the LED will turn red. I plan to initiate more ghosts as the game level rises.

````
void ghosts() {
  image(ghost1, xposGhost[0], yposGhost[0], 20, 20);
  if (yposGhost[0] < 53 || yposGhost[0] > 567) {
    speed[0] = -speed[0];
  }
```` 

<img src= "https://github.com/martapienkosz/interactivemedia/blob/master/finalProject/data/ghost1.png" height= "75"> <img src= "https://github.com/martapienkosz/interactivemedia/blob/master/finalProject/data/ghost2.png" height= "75"> <img src= "https://github.com/martapienkosz/interactivemedia/blob/master/finalProject/data/ghost3.png" height= "75"> <img src= "https://github.com/martapienkosz/interactivemedia/blob/master/finalProject/data/ghost4.png" height= "75">


Checking for a collision and sending a signal back to arduino.

````
if (xpos > xposGhost[0] && xpos < (xposGhost[0] + 20)) {
  if (ypos > yposGhost[0] && ypos < (yposGhost[0] + 20)) {
  myPort.write('R');
}
````


![alt-text](https://github.com/martapienkosz/interactivemedia/blob/master/Media/gvideo1.gif)


## Wednesday, December 2
### Ghosts
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

I also decided to add a side switch so that the LED and sensors would not light up the entire time the arduino is plugged in.

````
void loop() {
  if (digitalRead(8) == HIGH) {
````


## Thursday, December 3
### Visuals and design
I decided to deviate from my original idea of "follow the line" Game and create something similar to a packman. I found the appropriate graphics on the internet, and then in Photoshop I separated the elements, created a board background, a score counter.

<img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr3.png" height= "400"> <img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr9.png" height= "400"> 

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

![alt-text](https://github.com/martapienkosz/interactivemedia/blob/master/Media/gvideo2.gif)


## Friday, December 4
### Collisions
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

<img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr7.png" height= "400"> <img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr8.png" height= "400"> 

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

![alt-text](https://github.com/martapienkosz/interactivemedia/blob/master/Media/gvideo3.gif)


## Saturday, December 5
### Sprites

<img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr13.png" height= "200">

Finally, I decided to change the image of pacman so that it appears to be animated. So I downloaded sprites form the internet and modified them slightly in the photoshop. I wanted create an array with the following code but it didn't work.

```
if (frameCount%3==0) {
  step = (step+1) % 3;
}
image(packman_spritesheet, xpos, ypos, 60, 20, 0+(step*20), 0, 20+(step*20), 20);
```

After some attepts I droped the idea of packman moving up, down and to the left. Because of certain uncertainty with my sensors it became really hard to tell in which direction in the packman moving. This is the result:

![alt-text](https://github.com/martapienkosz/interactivemedia/blob/master/Media/gvideo5.gif)



## Monday, December 7
### Final touches

In the last phase of the project, I created the schematics. I believe my game is running smoothly and no further improvement is needed. Overall, I'm happy with how everything is combined into one finished project.

<img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr11.png" width= "800">
