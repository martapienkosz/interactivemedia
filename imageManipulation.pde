//Image manipulation
//Marta Pienkosz, due October 13
//mousePressed changes placement of tiles , you can adjust the number of of tiles (tileAmount)

PImage img;
int tileAmount = int(random(5,40));
int tileSize = 1000/tileAmount;


void setup() {
  size(1000, 1000);
  img = loadImage("hotel.jpg");
  image(img, 0, 0, 1000, 1000);
}

void draw() {
  if (mousePressed == true) {
    image(img, 0, 0, 1000, 1000);
    for (int a=0; a<= tileAmount; a++) {
      for (int i=0; i<= tileAmount; i++) {
        PImage newImage = img.get(int(random(img.width-tileSize)), int(random(img.width-tileSize)), tileSize, tileSize);
        tint(225, 225, 225, 100);
        image (newImage, 0+a*tileSize, (0+i*tileSize));
      }
    }
  }
}
