// defines variables
#define echoPin 6
#define trigPin 7

// duraration of sound wave travel adn distance measurement
long duration;
int distance;

// corresponds to reading from Processing
int response = 0;
int redLed = 10;
int greenLed = 11;
int blueLed = 12;

//varaibles used to smooth the readings from the Ultrasonic Sensor
const int numReadings = 15;
int readings[numReadings];
int readIndex = 0;
int total = 0;
int average = 0;
int switchOff;


void setup() {
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(redLed, OUTPUT);
  pinMode(greenLed, OUTPUT);
  pinMode(blueLed, OUTPUT);
  pinMode(8, INPUT);
  Serial.begin(9600);

  //  creating an array that stores readings
  for (int thisReading = 0; thisReading < numReadings; thisReading++) {
    readings[thisReading] = 0;
  }
}

void loop() {
  if (digitalRead(8) == HIGH) {
    response = Serial.read();
    // clears the trigPin condition
    digitalWrite(trigPin, LOW);
    delayMicroseconds(2);
    // activates the trigPin for 10 microseconds
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);

    // reads the echoPin, returns the sound wave travel time in microseconds
    total = total - readings[readIndex];
    readings[readIndex] = pulseIn(echoPin, HIGH);

    // averages the sensor by taking 20 readings
    total = total + readings[readIndex];
    readIndex = readIndex + 1;
    if (readIndex >= numReadings) {
      readIndex = 0;
    }
    average = total / numReadings;

    // speed of sound wave divided by 2 (go and back)
    distance = average * 0.034 / 2;

    // reads from potentiometer
    int secondSensor = analogRead(A1);
    Serial.print(distance);
    Serial.print(",");
    Serial.println(secondSensor);


    // changes the RGB diode color depending on the reading from Processing
    if (response == 'W') {
      RGB_color(255, 255, 255); // White
    }
    if (response == 'Y') {
      RGB_color(255, 255, 0); // Yellow
      delay(25);
    }
    if (response == 'R') {
      RGB_color(255, 0, 0); // Red
      delay(25);
    }
    if (response == 'B') {
      RGB_color(0, 0, 255); // Blue
      delay(50);
    }

  } else {
    // turing the LED off when the side switch == low, sensors only reads when side switch == high
    Serial.println(switchOff);
    analogWrite(redLed, LOW);
    analogWrite(greenLed, LOW);
    analogWrite(blueLed, LOW);
  }
}


void RGB_color(int redValue, int greenValue, int blueValue) {
  // pairs the specified value with the specified output
  analogWrite(redLed, redValue);
  analogWrite(greenLed, greenValue);
  analogWrite(blueLed, blueValue);
}
