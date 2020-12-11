## Final Project
### Cherry-man

For my last project, I created an interactive version of Pac Man where the player adjusts the sensors instead of using the keyboard arrows. Skim through [this page](https://github.com/martapienkosz/interactivemedia/blob/master/finalProject/journal.md) to learn more about the project. [Here](https://drive.google.com/file/d/1tTu0cZ11i4OVjSsQgJ17QdALKf_O11EA/view?usp=sharing) you can find a game preview showing the interaction between Processing and Arduino. [Here](https://drive.google.com/file/d/1tQZ-tte18zLt6rMmS_dTMdtvdNMafPEc/view?usp=sharing), however, you can find a video of the game.

The idea of the game is that the user controls the movement of packman on the screen with two sensors. Its task is to avoid ghosts and collect cherries pleaced on the screen. Gaining a point is signified by changing the color of the LEDs from white to yellow. A collision with a ghosts turns the LED red. I used the readings from both of these sensors to control packman x position (ultrasonic sensor) and y position(potentiometer).


### Pictures

<img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/pic1.jpg" width= "300"> <img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/pic2.jpg" width= "300"> <img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/pic3.jpg" width= "300">


### Schematics

<img src= "https://github.com/martapienkosz/interactivemedia/blob/master/Media/scr11.png" width= "800">


### Challenges
<li> I spend quite a lot of time figuring out how to map readings form the sensors with x and y position of the packman. The ultrasonic sensor isn’t accurate enough and this created an impression of packman spontaneous jumping out of the screen. I managed to smooth the sensor by averaging the readings which partly solved the problem. </li>
<li> Displaying instruction and game over pages as well as turning the LEDs on after the collisions involved a very careful coding. I had to create several a variables and think carefully where to put specific lines of codes. At the end I think creating a finished game allowed me to understand how the code is being processed by the computer. I am really satisfied with how smoothly all transitions are being executed. </li>

