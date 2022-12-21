//This is a simple snowflake simulation that simulates snowflakes falling from the top of the screen to the bottom
//The code here uses a modified version of the my final project 

PVector[] circle;
int total = 0;
float rectX = 500;
float moveX = 50;
PImage snowflake;

void setup(){
  size(800,800);
  snowflake = loadImage("snowflake.png"); //Image from: https://www.kapwing.com/explore/snowflake-printable-template
  circle = new PVector[999];
  for (int i=0; i<999; i++) {
    circle[i] = new PVector(random(50,width-50), 0, random(255));
  }
}

void draw(){
  flakes();
  counter();
}

void flakes(){
  fill(0,255,0);
  background(0);
  for (int i=0; i<total; i++) {
    //ellipse(circle[i].x,circle[i].y,25,25);
    image(snowflake,circle[i].x,circle[i].y,50,50);
    circle[i].y = circle[i].y + 5;
  }
}

void counter(){
  rect(rectX,900,25,25);
  rectX = rectX + moveX;
  
  if(rectX > width || rectX < 0) {
    moveX *= -1;
    total += 1;
  }
}
