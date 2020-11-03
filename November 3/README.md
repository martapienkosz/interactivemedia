## LightGame
### Get10

### 1. Idea
The idea behind this game was to assign a certain number of points to each button. The player has to press the buttons in such a way that the sum of the points gives 10 points. Then all the lights come on. I wanted to assign 1 to blue, 2 to red, 3 to green, and 5 to yellow. Thus, when the user presses the red button 5 times or the yellow button 2, all the lights will come on. Of course, the player is unaware of what value is assigned to each button.

### 3. Breadbord, coneccting wires, leds and buttons.
Here is the Schematic:

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov30.png" width="900">

And real pictures:

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov31.jpg" width="300"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov32.jpg" width="300"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov33.jpg" width="300">


### 3. Challanges
For some reason assigning cnt variable didn't work.
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
 I am not sure why is that, and what to make to change it. I uploaded the code I came up with.
