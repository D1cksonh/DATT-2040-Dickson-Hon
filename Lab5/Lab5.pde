//This lab project uses the the datt 2040 github code, it is a modified version of it to create what I want
// This project is the growing and shrinking of a flower named the Red spider lily
// If you don't know what this flower is, here is a wikipedia page about it --> https://en.wikipedia.org/wiki/Lycoris_radiata
// The flower will grow and shrik based on set intervals
// When the flower grows the colors of the shape will turn red, when the flower shriks or curls the colors will become black

float theta;   
float squareX = 10;
float moveX = 7;

void setup() {
  size(640, 360);
}

void draw() {
  background(0);
  frameRate(30);
  stroke(255);
  timeBox();
  
  float a = (squareX / (float) width) * 90f;
  theta = radians(a);
  translate(width/2,height);
  rect(0,0,0,-120);
  translate(0,-120);
  branch(120);
}

void branch(float h) {
  h *= 0.60;
  
  if (h > 2) {
    fill(squareX/2,0,0);
    pushMatrix();   
    rotate(theta);   
    line(0,0,0, -h); 
    translate(0, -h); 
    branch(h);      
    popMatrix();     
    
    pushMatrix();
    rotate(-theta);
    ellipse(0, 30, 20, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}

void timeBox(){
  fill(255);
  rect(squareX, 999, 50, 50);
  squareX = squareX + moveX;
  
  if(squareX > 400 || squareX < 0){
   moveX *= -1;
  }
}
