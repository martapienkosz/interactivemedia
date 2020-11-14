// Musical Instrument
// Marta Pienkosz, due November 17
// Buttons work as a switches that turn the buzzer on and off. Each switch corresponds to a different
// tone (green to A, yellow to C and blue to G). The intensity of the light generates how high or how
// low the sound will be, i.e. at high intensity the tones will be A6, C6 and G6, with medium it will
// be A4, C4 and G4, and with minimum intensity A2, C2 and G2.

const int blueButton = A3;
const int yellowButton = A2;
const int  greenButton = A1;

int blueButtonState, yellowButtonState, greenButtonState = 0;
int lastBlueButtonState, lastYellowButtonState, lastGreenButtonState = 0;
int bluePushCounter, yellowPushCounter, greenPushCounter = 0;

#include "pitches.h"

// creating an arrays that store different tones, index 0 correspond to green button, 1 to yellow, and 2 to blue
int melodyLow[] = {
  NOTE_A2, NOTE_C2, NOTE_G2
};

int melodyMiddle[] = {
  NOTE_A4, NOTE_C4, NOTE_G4
};

int melodyHigh[] = {
  NOTE_A6, NOTE_C6, NOTE_G6
};

void setup() {
  pinMode(8, OUTPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  Serial.begin(9600);
}

void loop() {
  // storing the readings form the photoresistor
  int sensorValue = analogRead(A0);
  Serial.println(sensorValue);
  delay(1);

  int blueButtonState = digitalRead(blueButton);
  if (blueButtonState != lastBlueButtonState) {
    if (blueButtonState == HIGH) {
      // when user presses the button, bluePushCounter is increment by 1
      bluePushCounter += 1;
    }
  }
  // Making a real switch, when player press the button buzzer is on, pressing button once again turns the buzzer off. Thanks to this tones can be played simultanesly
  if (bluePushCounter % 2 == 1) {
    // depending on the intensity of light, tones from different arrays will be played
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

  lastBlueButtonState = blueButtonState;

  int yellowButtonState = digitalRead(yellowButton);
  if (yellowButtonState != lastYellowButtonState) {
    if (yellowButtonState == HIGH) {
      yellowPushCounter += 1;
    }
  }
  if (yellowPushCounter % 2 == 1) {
    if (sensorValue <= 930) {
      tone(8, melodyLow[1]);
    }
    if (sensorValue > 930 and sensorValue <= 980) {
      tone(8, melodyMiddle[1]);
    }
    if (sensorValue > 980) {
      tone(8, melodyHigh[1]);
    }
  } else {
    noTone(8);
  }

  lastYellowButtonState = yellowButtonState;

  int greenButtonState = digitalRead(greenButton);
  if (greenButtonState != lastGreenButtonState) {
    if (greenButtonState == HIGH) {
      greenPushCounter += 1;
    }
  }
  if (greenPushCounter % 2 == 1) {
    if (sensorValue <= 930) {
      tone(8, melodyLow[0]);
    }
    if (sensorValue > 930 and sensorValue <= 980) {
      tone(8, melodyMiddle[0]);
    }
    if (sensorValue > 980) {
      tone(8, melodyHigh[0]);
    }
  } else {
    noTone(8);
  }

  lastGreenButtonState = greenButtonState;
}
