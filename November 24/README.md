## Game
### Communication: Processing and Arduino

### 1. Idea
The idea of the game is that the user controls the movement of the ball on the screen with two sensors. Its task is to follow the instructions on the screen to get the checkpoints and finaly change the color of LED to blue. Gaining a point is signified by changing the color of the LEDs from white. I used the readings from both of these sensors to control the ball x position (ultrasonic sensor) and y position(potentiometer).

[This](https://drive.google.com/file/d/1ulfjGoZxMpCM56Oqk8ds434B8zzkwXdN/view?usp=sharing) is a little preview.

### 3. Breadbord, coneccting wires, leds and buttons.
Here is the Schematic:

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov%20170.png" width="800">

And real pictures:

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov%20171.jpg" width="300"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov172.jpg" width="300"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov%20173.jpg" width="300">


### 3. Ultrasonic sensor
I used following Arduino [tutorial](https://create.arduino.cc/projecthub/abdularbi17/ultrasonic-sensor-hc-sr04-with-arduino-tutorial-327ff6) to receive reading from the Utrasonic sensor. Nextly in procesing I maped those reading with the width of the screen `xpos = map(sensors[0], 0, 30, 0, width)`.

````
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // activates the trigPin for 10 microseconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
  distance = duration * 0.034 / 2; // Speed of sound wave divided by 2 (go and back)
````


### 4. Potentiometer 
Reading from a potentiometer is relatively easier to obtain. Similarly, I mapped the results `ypos = map(sensors[1], 0, 1023, 0, height)`

````
int secondSensor = analogRead(A1);
Serial.println(secondSensor);
````


### 5. Turing the LED on
I have established communication between Processing and Arduino by using correspondingly `myPort.write()` and `Serial.read()` functions. The `if statement` was used to change the color of the LED every time the ball reaches the area of the white rectangle.

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
