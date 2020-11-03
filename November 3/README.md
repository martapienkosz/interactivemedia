## LightGame
### Get10

### 1. Idea
The idea is to assign a certain amount of points to every buttom. The player needs to press buttoms in a way, that the sumation of points would give 10 point. Then all the lighs lit. 

![alt-text](https://github.com/martapienkosz/interactivemedia/blob/master/Media/spaceAnimation.gif)

Below I describe the process of creating it.

### 2. Challanges
For some reason assigning cnt variable didn't work :(
````
  BUTTONstate4 = digitalRead(yellowButton);
  if (BUTTONstate4 == HIGH) {
    digitalWrite(yellowLED, HIGH);
    delay(100);
    cnt += 5;
  }
  else {
    digitalWrite(yellowLED, LOW);
  }

  if (cnt == 10) {
    digitalWrite(blueLED, HIGH);
    digitalWrite(redLED, HIGH);
    digitalWrite(greenLED, HIGH);
    digitalWrite(yellowLED, HIGH);
    cnt = 0;
  }
}
````

### 3. Exporting data to csv and processing
I have creating a simplified verison of excel file, containing only numbers without the company names. I struggled to export data to processing, I tried both the terminal and csv export option. Only later I have discovered that the csv file must be located in the data folder where the processing file is. I used the example form the lesson to check if it works. [Here](https://github.com/martapienkosz/interactivemedia/blob/master/October%206/data/space.csv) you can find finalized data in a correct format.

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/ex_4.1.png" width="700">

### 4. Creating circles
I have created circles that visually represent the number of missions started by a given companion. The diameter of each circle corresponds to the value of the missions carried out. The largest circle therefore represents the RVSN USSR's 1777 missions. The second largest is Arianespace with 279 missions. I was suprised to discovered that NASA carried only 203 missions.

This is part of the `setup()` code that randomly places circles with a specified diameters and colors:

This were the results:

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/ex_4.6.png" width="350"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/ex_4.7.png" width="350"> 

### 5. Creating animation
Nextly, I set up `frameRate (6)` and used the expression below in a `void draw()`, so that during each frame another circle is being drawn at a random location. At frst, I wanted the circles to move slowly across the screen, however I liked the effect of endless fading in and out of circles. Finding experimentally a right number for opacity was super vital.

At the end I added `mousePressed` function to increase a level of interactivity. 


I have to say I really like the effect of the two mixing colors shown in the screenshot below.

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/ex_4.5.png" width="400"> 
