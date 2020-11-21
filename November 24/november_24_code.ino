// defines variables
#define echoPin 7
#define trigPin 6

// duraration of sound wave travel adn distance measurement
long duration;
int distance;
// corresponds to reading from Processing
int response = 0;
int redLed = 11;
int greenLed = 12;
int blueLed = 13;

void setup() {
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(redLed, OUTPUT);
  pinMode(greenLed, OUTPUT);
  pinMode(blueLed, OUTPUT);
  Serial.begin(9600);
}
void loop() {
  response = Serial.read();
  // Clears the trigPin condition
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // activates the trigPin for 10 microseconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
  distance = duration * 0.034 / 2; // Speed of sound wave divided by 2 (go and back)
  // reads from potentiometer
  int secondSensor = analogRead(A1);
  Serial.print(distance);
  Serial.print(",");
  Serial.println(secondSensor);

  // changes the RGB diode color depending on the reading from Processing
  if (response == 'W') {
    RGB_color(255, 255, 255); // White
  }
  if (response == 'R') {
    RGB_color(255, 255, 125); // Raspberry
  }
  if (response == 'C') {
    RGB_color(0, 255, 255); // Cyan
  }
  if (response == 'M') {
    RGB_color(255, 0, 255); // Magenta
  }
  if (response == 'B') {
    RGB_color(0, 0, 255); // Blue
  }
}

void RGB_color(int redValue, int greenValue, int blueValue) {
  // pairs the specified value with the specified output
  analogWrite(redLed, redValue);
  analogWrite(greenLed, greenValue);
  analogWrite(blueLed, blueValue);
}
