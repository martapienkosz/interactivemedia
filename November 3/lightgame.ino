const int blueLED = 12;
const int redLED = 10;
const int greenLED = 8;
const int yellowLED = 6;

const byte blueButton = A1;
const byte redButton = A2;
const byte greenButton = A3;
const byte yellowButton = A4;

int buttonPushCounter = 0;

// 1 is blue, 2 is red, 3 is green, 4 is yellow
int BUTTONstate1 = 0;     
int BUTTONstate2 = 0;
int BUTTONstate3 = 0;
int BUTTONstate4 = 0;

int lastButtonState1 = 0;
int lastButtonState2 = 0;
int lastButtonState3 = 0;
int lastButtonState4 = 0;

void setup() {
  pinMode(6, OUTPUT);
  pinMode(8, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  pinMode(A4, INPUT);
  Serial.begin(9600);
}

void loop() {
  // read the pushbutton input pin:
  int BUTTONstate1 = digitalRead(blueButton);
  // turn the led on when a button is pressed, and off when it is released
  if (BUTTONstate1 == HIGH) {
    digitalWrite(blueLED, HIGH);
    delay(100);
  }
  else {
    digitalWrite(blueLED, LOW);
  }
  // set buttonPushCounter to 0 when the transition from button on and off occurs
  if (BUTTONstate1 != lastButtonState1) {
    if (BUTTONstate1 == HIGH) {
      buttonPushCounter = 0;
      // debugging, checking if the buttonPushCounter actually works
//      Serial.print("number of button pushes: ");
//      Serial.println(buttonPushCounter);
    }
  }
  lastButtonState1 = BUTTONstate1;

  // the same steps are being used for blue button and led
  int BUTTONstate2 = digitalRead(redButton);
  if (BUTTONstate2 == HIGH) {
    digitalWrite(redLED, HIGH);
    delay(100);
  }
  else {
    digitalWrite(redLED, LOW);
  }
  if (BUTTONstate2 != lastButtonState2) {
    if (BUTTONstate2 == HIGH) {
      buttonPushCounter += 2;
    }
  }
  lastButtonState2 = BUTTONstate2;

  // the same steps are being used for green button and led
  int BUTTONstate3 = digitalRead(greenButton);

  if (BUTTONstate3 == HIGH) {
    digitalWrite(greenLED, HIGH);
    delay(100);
  }
  else {
    digitalWrite(greenLED, LOW);
  }

  if (BUTTONstate3 != lastButtonState3) {
    if (BUTTONstate3 == HIGH) {
      buttonPushCounter += 1;
    }
  }
  lastButtonState3 = BUTTONstate3;

  // the same steps are being used for yellow button and led
  int BUTTONstate4 = digitalRead(yellowButton);
  if (BUTTONstate4 == HIGH) {
    digitalWrite(yellowLED, HIGH);
    delay(100);
  }
  else {
    digitalWrite(yellowLED, LOW);
  }
  if (BUTTONstate4 != lastButtonState4) {
    if (BUTTONstate4 == HIGH) {
      buttonPushCounter += 5;
    }
  }
  lastButtonState4 = BUTTONstate4;


  if (buttonPushCounter == 10) {
    digitalWrite(blueLED, HIGH);
    delay(100);
    digitalWrite(redLED, HIGH);
    delay(100);
    digitalWrite(greenLED, HIGH);
    delay(100);
    digitalWrite(yellowLED, HIGH);
    delay(100);
    buttonPushCounter = 0;
  }
  if (buttonPushCounter != 10) {
    digitalWrite(blueLED, LOW);
    digitalWrite(redLED, LOW);
    digitalWrite(greenLED, LOW);
    digitalWrite(yellowLED, LOW);
  }
}
