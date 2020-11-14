## Sound
### Musical Instrument

### 1. Idea
For this project I decided to use one analog sensor (photoresistor), three digital sensors (toggle switches) as well as a buzzer. When the user presses the button once, a sound is played. Pressing the button again turns the sound off. Pressing two buttons allows the user to merge tones. Each switch corresponds to a different tone (green to A, yellow to C and blue to G). The intensity of the light generates how high or how low the sound will be, i.e. at high intensity the tones will be A6, C6 and G6, with medium it will be A4, C4 and G4, and with minimum intensity A2, C2 and G2.

[This](https://drive.google.com/file/d/1ulfjGoZxMpCM56Oqk8ds434B8zzkwXdN/view?usp=sharing) is a little preview.

### 3. Breadbord, coneccting wires, leds and buttons.
Here is the Schematic:

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov%20170.png" width="800">

And real pictures:

<img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov%20171.jpg" width="300"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov172.jpg" width="300"> <img src="https://github.com/martapienkosz/interactivemedia/blob/master/Media/nov%20173.jpg" width="300">


### 3. Initiating switch
Similarly to my last project, I used modulus operator to detect every second time user presses the button. This way the sound can be played on and off, user doesn't have to hold the button.

````
if (blueButtonState == HIGH) {
  bluePushCounter += 1;
}
if (bluePushCounter % 2 == 1) {
````


### 4. Making an array of tones
I have created three areas that will store certain tons. The light intensity will be used to choose from among the three melody tables. Index 0, 1, and 2 will be used to indicate the switch.

````
int melodyLow[] = {
  NOTE_A2, NOTE_C2, NOTE_G2
};

int melodyMiddle[] = {
  NOTE_A4, NOTE_C4, NOTE_G4
};

int melodyHigh[] = {
  NOTE_A6, NOTE_C6, NOTE_G6
};
````
 
### 4. Photoresistor
I set `int sensorValue = analogRead (A0);` to get the reading from the photoresistor. Several if statements allowed different tones to be played depending on the reading (for blue G2, G4 or G6). I did the exact same thing for other two buttons.

````
  if (bluePushCounter % 2 == 1) {
    if (sensorValue <= 930) {
      tone(8, melodyLow[2]);
    }
    if (sensorValue > 930 and sensorValue <= 980) {
      tone(8, melodyMiddle[2]);
    }
    if (sensorValue > 980) {
      tone(8, melodyHigh[2]);
    }
  } else {
    noTone(8);
  }
````
