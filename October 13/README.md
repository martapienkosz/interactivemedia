



```
    for (int a=0; a<= 20; a++) {
      for (int i=0; i<= 20; i++) {
        PImage newImage = img.get(int(random(img.width-tileSize)), int(random(img.width-tileSize)), tileSize, tileSize);
        tint(225, 225, 225, 150);
        image (newImage, random(width), random(height));
      }
      ````
