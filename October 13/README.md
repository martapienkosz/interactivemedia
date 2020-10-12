## Image manipulation
### This is a simple work of art

### 1. Final work
Please have a look at my final image. 

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/5_7.png" width="600">

Below I describe the process of creating it.

### 1. Finding database
The idea behind this design was to shuffle certain regular parts of the picture, thus creating a disorder. At first I decided to randomly place randomly chosen parts of the image:

````
for (int i=0; i<= 50; a++) {
  PImage newImage = img.get(int(random(img.width-tileSize)), int(random(img.width-tileSize)), tileSize, tileSize);
  tint(225, 225, 225);
  image (newImage, random(width), random(height));
}
````
This were the effects. Changing the opacity to `tint(225, 225, 225, 150)` for the third picture resulted in an even better effect:
<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/5_8.png" width="300"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/5_9.png" width="300">  <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/5_6.png" width="300">  

### 2. Nested for loop
The outcome was slightly too random, therefore I have decided to shuffle parts only with an establish grid. I have introduced new variables `a` to determine more precise x and y position (`0+a*tileSize` and `(0+i*tileSize`).

````
for (int a=0; a<= tileAmount; a++) {
  for (int i=0; i<= tileAmount; i++) {
    PImage newImage = img.get(int(random(img.width-tileSize)), int(random(img.width-tileSize)), tileSize, tileSize);
    tint(225, 225, 225, 150);
    image (newImage, 0+a*tileSize, 0+i*tileSize);
  }
}
````
Also, depending on the random number selected by the computer, the parameters `tileSize` and `tileAmount` are adjusted accordingly.
````
PImage img;
int tileAmount = int(random(5,40));
int tileSize = 1000/tileAmount;
````

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/5_5.png" width="300"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/5_1.png" width="300">  <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/5_2.png" width="300">  

````
PImage img;
int tileAmount = int(random(5,40));
int tileSize = 1000/tileAmount;
````

### 3. Mouse Pressed
At the very end I have incorporated `mousePressed` function, so that user has a choice to shuffle parts of picture. 

````
void draw() {
  if (mousePressed == true) {
    image(img, 0, 0, 1000, 1000);
    for (int a=0; a<= tileAmount; a++) {
      for (int i=0; i<= tileAmount; i++) {
        PImage newImage = img.get(int(random(img.width-tileSize)), int(random(img.width-tileSize)), tileSize, tileSize);
        tint(225, 225, 225, 150);
        image (newImage, 0+a*tileSize, (0+i*tileSize));
      }
    }
  }
}
````
