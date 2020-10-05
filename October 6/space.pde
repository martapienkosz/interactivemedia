//A visual presentation of the number of space missions carried out by various companies. Radius of given circle corresponds to number of missions.
//Marta Pienkosz, due October 6
//mousePressed changes color
//source: https://www.kaggle.com/agirlcoding/all-space-missions-from-1957

int data[];   
float xpos, ypos;

void setup() { 
  size(1000, 1000);
  background(255);
  frameRate(6);
  // Importing data from a csv file
  String stuff[] = loadStrings("space.csv");
  println(stuff.length);
  data = int( split(stuff[0], ',' ) );
  printArray(data);
}
void draw() {
  for (int i = 0; i < data.length; i ++ ) {
    // Choosing random position for a circle
    xpos = random(width);
    ypos = random(height);
    //mousePressed changes color
    if (mousePressed == true) {
      fill(100, data[i], 200, 60);
    } else {
      fill(100, 100, data[i], 60);
    }
    //Radius corresponds to number of missions carried by given company
    ellipse(random(width), random(height), data[i], data[i]);
  }
  //useful to create a gif animation
  //saveFrame("######.png");
}
