## Animation, Conditionals, Loops
### This is a simple work of art

### 1. Idea
The main idea behind this project was to create an allusion of depth on a 2D screen. I tried to manipulate lines and colors to create cubic structures. 
I'm not very familiar with rgb palettes so decided to google some interesting pastel colors in shades of blue.
<li>
<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/blue.png" width="200">
<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/grey.png" width="200">
<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/dark%blue.png" width="200"> </li>


````
void setup() {
  size(900, 900);
  background(255);
  frameRate(8);
}

float a;

void draw () {
  line(200, 0, 200, 80-a);
  a=a-10;
}

````

![tekst alternatywny](url grafiki)
<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/blue.png" width="250">
