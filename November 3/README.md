## LightGame
### Get10

### 1. Idea
The idea behind this game was to assign a certain number of points to each button ( 0 to blue, 2 to red, 1 to green, and 5 to yellow). The player has to press the buttons in such a way that the sum of the points gives 10 points. Then all the lights turn on.

This is a little preview. When I press 5 times red light, all lights turn on. The same is happening when I press yellow button 2 times. 

![alt-text](https://github.com/martapienkosz/interactivemedia/blob/master/Media/lightgame.mp4)


### 3. Breadbord, coneccting wires, leds and buttons.
Here is the Schematic:

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/n30.png" width="800">

And real pictures:

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov31.jpg" width="300"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov32.jpg" width="300"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov33.jpg" width="300">


### 3. Looping Error
For some reason the cnt variable didn't work the way I wanted it to. It is because the loop() function is running really fast
so even if I try to press and release the button as quickly as I can, loop() might run many times and my count would increase by that many times.

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

Those code snippets helped me to detect an error : 

```
Serial.begin(9600);
Serial.print("red is true; adding 1; count = ");
Serial.println(cnt);
```
<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov34.png" width="300">


### 4.Solution

The right solution is to detect when the button transitions from not being pressed to being pressed, and count that event. This will be immune to long presses because the transition only happens once no matter how long the button is pressed. Just two if statements were needed for the buttonPushCounter to work the way I needed it. It is explained better in [this article](https://www.arduino.cc/en/Tutorial/BuiltInExamples/StateChangeDetection).

````
  if (BUTTONstate4 != lastButtonState4) {
    if (BUTTONstate4 == HIGH) {
      buttonPushCounter += 5;
    }
  }
  lastButtonState4 = BUTTONstate4;
 ````
