## Data visualization
### This is a simple work of art

### 1. Final work
Please have a look at my final image. 

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/5_7.png" width="600">

Below I describe the process of creating it.

### 1. Finding database
I found a very inteersting data set on Kaggle: [All space missions form 1957](https://www.kaggle.com/agirlcoding/all-space-missions-from-1957). I decided to simplify the data and present visually how many times a given company has carried out a space mission. I used a excel `COUNTIF` to do so.

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/ex_4.2.png" width="700"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/ex_4.3.png" width="170">
<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/5_1.png" width="300">  <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/5_2.png" width="300"> 

### 2. Exporting data to csv and processing
I have creating a simplified verison of excel file, containing only numbers without the company names. I struggled to export data to processing, I tried both the terminal and csv export option. Only later I have discovered that the csv file must be located in the data folder where the processing file is. I used the example form the lesson to check if it works. [Here](https://github.com/martapienkosz/interactivemedia/blob/master/October%206/data/space.csv) you can find finalized data in a correct format.

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/ex_4.1.png" width="700">

### 3. Creating circles
I have created circles that visually represent the number of missions started by a given companion. The diameter of each circle corresponds to the value of the missions carried out. The largest circle therefore represents the RVSN USSR's 1777 missions. The second largest is Arianespace with 279 missions. I was suprised to discovered that NASA carried only 203 missions.

This is part of the `setup()` code that randomly places circles with a specified diameters and colors:

````
for (int i = 0; i < data.length; i ++ ) {
  fill(0, 0, data[i], 60);
  ellipse(random(width), random(height), data[i], data[i]);
````
This were the results:

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/ex_4.6.png" width="350"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/ex_4.7.png" width="350"> 




```
    for (int a=0; a<= 20; a++) {
      for (int i=0; i<= 20; i++) {
        PImage newImage = img.get(int(random(img.width-tileSize)), int(random(img.width-tileSize)), tileSize, tileSize);
        tint(225, 225, 225, 150);
        image (newImage, random(width), random(height));
      }
      ````
