const int blueLED = 12;
const int redLED = 10;
const int greenLED = 8;
const int yellowLED = 6;

const byte blueButton = A1;
const byte redButton = A2;
const byte greenButton = A3;
const byte yellowButton = A4;

int BUTTONstate1 = 0;
int BUTTONstate2 = 0;
int BUTTONstate3 = 0;
int BUTTONstate4 = 0;
int cnt = 0;

boolean b = false;
boolean r = false;
boolean g = false;
boolean y = false;

void setup() {
  pinMode(6, OUTPUT);
  pinMode(8, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  pinMode(A4, INPUT);
}

void loop() {
  BUTTONstate1 = digitalRead(blueButton);
  if (BUTTONstate1 == HIGH) {
    digitalWrite(blueLED, HIGH);
    delay(100);
    b = true;
  }
  else {
    digitalWrite(blueLED, LOW);
  }
  if (b == true) {
    cnt = 0;
    b = false;
  }

  BUTTONstate2 = digitalRead(redButton);
  if (BUTTONstate2 == HIGH)
  {
    digitalWrite(redLED, HIGH);
    delay(100);
    r = true;
  }
  else {
    digitalWrite(redLED, LOW);
  }
  if (r == true) {
    cnt += 1;
    r = false;
  }

  BUTTONstate3 = digitalRead(greenButton);
  if (BUTTONstate3 == HIGH) {
    digitalWrite(greenLED, HIGH);
    delay(100);
    g = true;
  }
  else {
    digitalWrite(greenLED, LOW);
  }
  if (g == true) {
    cnt += 3;
    g = false;
  }

  BUTTONstate4 = digitalRead(yellowButton);
  if (BUTTONstate4 == HIGH) {
    digitalWrite(yellowLED, HIGH);
    delay(100);
    y = true ;
  }
  else {
    digitalWrite(yellowLED, LOW);
  }
  if (y == true) {
    cnt += 5;
    y = false;
  }
  
  if (cnt == 10) {
    cnt = 0;
    digitalWrite(blueLED, HIGH);
    delay(100);
    digitalWrite(redLED, HIGH);
    delay(100);
    digitalWrite(greenLED, HIGH);
    delay(100);
    digitalWrite(yellowLED, HIGH);
    delay(100);
  }
}
