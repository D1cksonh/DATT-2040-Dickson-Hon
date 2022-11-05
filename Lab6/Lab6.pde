// The code was take, referenced and modified a little from the coding train
// This code takes the pixels of the image ans slowly create the image 
// The image is being created by the code placing random squares anywhere on to create the image
// You can press r to reset the pixels generating on the screen

PImage img;
float redX, greenX, blueX = 0;

void setup() {
  size(400,400);
  img = loadImage("Lucina.jpg");// image source = https://www.pinterest.ca/pin/AYW1qYufJEferKV1iezT6Teu8MoPrm0e72_uMOw2tHcAH6hmgd-0Gt8/
  img.loadPixels();
  background(0);
}

void draw() {
  dots();
  erase();
}

void dots() {
  for(int i = 0; i < 2; i++) { 
    int x = int(random(img.width));
    int y = int(random(img.height));
    
    float r = red(img.get(int(x),int(y)));
    //float g = green(img.get(int(x),int(y)));
    float b = blue(img.get(int(x),int(y)));
    
    fill(r,0,b,100);
    noStroke();
    rect(x,y,8,8);
  }
}

void erase() {
 if(keyPressed && key == 'r'){
  background(0); 
 } 
}
