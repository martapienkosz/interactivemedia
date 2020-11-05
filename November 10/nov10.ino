//Fading
//Marta Pienkosz, due November 10
//Buttons work as a switches that turn LEDs on and off.  Adjusting the potentiometer additionally changes the frequency at which the LED goes out.

const int blueLED = 9;
const int redLED = 11;
const byte blueButton = A4;
const byte redButton = A3;

int BlueButtonState, RedButtonState = 0;
int fade, sensorValueAdopted = 0;
int lastBlueButtonState, lastRedButtonState = 0;
int bluePushCounter, redPushCounter = 0;

void setup() {
  pinMode(9, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(A3, INPUT);
  pinMode(A4, INPUT);
  Serial.begin(9600);
}

void loop() {
  int sensorValue = analogRead(A2);
  //  checking the variable resistor, it reads from 0 to 1023
  Serial.println(sensorValue);
  //  setting an adequate frequency of fading, the greater the resistance, the quicker LED fades
  sensorValueAdopted= (sensorValue / 4);
  delay(1);

  int RedButtonState = digitalRead(redButton);
  if (RedButtonState != lastRedButtonState) {
    if (RedButtonState == HIGH) {
      // when user press the button, redPushCounter is increment by 1
      redPushCounter += 1;
    }
  }
  // making a real switch, when player press the button LED is on, pressing button once again switches the LED off
  if (redPushCounter % 2 == 1) {
    // the greater the resistance, the quicker LED fades, user can adjust this frequency by playing with potentiometer
    for (int fade = 0 ; fade <= 255; fade += sensorValueAdopted) {
      digitalWrite(redLED, fade);
      delay(100);
    }
  } else {
    digitalWrite(redLED, LOW);
  }
  lastRedButtonState = RedButtonState;

  // same thing is being done for second LED and button
  int BlueButtonState = digitalRead(blueButton);
  if (BlueButtonState != lastBlueButtonState) {
    if (BlueButtonState == HIGH) {
      bluePushCounter += 1;
    }
  }
  if (bluePushCounter % 2 == 1) {
    for (int fade = 0 ; fade <= 255; fade += sensorValueAdopted) {
      digitalWrite(blueLED, fade);
      delay(100);
    }
  } else {
    digitalWrite(blueLED, LOW);
  }
  lastBlueButtonState = BlueButtonState;
}
