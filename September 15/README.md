# Simple shapes, colors and arcs
## Have a look at my portrait.

### 1. Final image
This is my first work in processing: a very simple selfportrait.

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/martaimg.png" width="200">

### 2. Challenges: color
Using the rgb pallet turned out to be the most difficult part of this task. I'm not quite sure how to choose the numbers to create a realistic color. I found Google to very helpful.

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/ex_1.png" width="200">

### 3. CHORD function
After several unsuccessful attempts, I stumbled upon the CHORD function which allows you to create a semicircle instead of a circle segment. This has proved to be very useful in creating eyelids and fringe.
````
fill(94,19,3);
arc (380, 273, 65, 25, radians(210), radians(330), CHORD);
arc (520, 273, 65, 25, radians(210), radians(330), CHORD);
````
Below is the picture of an arc with the CHORD part (left eyelid) and without (right eyelid).
<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/ex_1.png" width="200">

### 4. Arcs and angles
Creating the fringe required me to select negative degrees of angles, which at first complicated the calculations a bit. Thanks to this, however, I undrestand the mesurements and degrees better.

````
//fringe
stroke(150,75,0);
fill(150,75,0);
arc (550, 125, 245, 160, radians(60), radians(200));
arc (350, 125, 250, 160, radians(-20), radians(120));
````
