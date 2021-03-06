size(900, 900);

//brown hair
stroke(150,75,0);
fill(150,75,0);
ellipse(width/2, height/3, 410, 450);
rect(245,300,410,350);

//neck
stroke(225,198,153);
fill(225,198,153);
rect(390, 475, 120, 70);

//face
ellipse(width/2, height/3, 300, 390);

//mouth
stroke(176,102,96);
strokeWeight(4);
arc (450, 360, 160, 110, radians(30), radians(150), OPEN);

//eyes
stroke(94,19,3);
strokeWeight(4);
arc (380, 250, 70, 30, radians(210), radians(330));
arc (520, 250, 70, 30, radians(210), radians(330));

stroke(225,225,225);
fill(225,225,225);
ellipse (380, 270, 60, 20);
ellipse (520, 270, 60, 20);

stroke(94,119,3);
fill(94,119,3);
ellipse (385, 270, 20, 20);
ellipse (525, 270, 20, 20);

stroke(94,19,3);
fill(94,19,3);
ellipse (385, 270, 5, 5);
ellipse (525, 270, 5, 5);

fill(94,19,3);
arc (380, 273, 65, 25, radians(210), radians(330), CHORD);
arc (520, 273, 65, 25, radians(210), radians(330));

//body
stroke(106,125,142);
fill(106,125,142);
arc (450, 605, 575, 130, radians(180), radians(360), CHORD);
rect(162, 605, 575, 300);

//v-neck
stroke(225,198,153);
fill(225,198,153);
triangle(390, 540, 450, 600, 510, 540);

//fringe
stroke(150,75,0);
fill(150,75,0);
arc (550, 125, 245, 160, radians(60), radians(200));
arc (350, 125, 250, 160, radians(-20), radians(120));
