//This sketch is wherever you click the mouse, you will create circles that will bounce off the walls of the sketch
//The circles will be a random color each time you left click in the sketch
//The circles will move in a random direction when you left click in the sketch
//Pressing any key on the keyboard will clean the sketch and reset it 
//The code used here is a "modifed" code on the DATT 2040 github 

//Circle Positions
PVector pos;
PVector acc; 

//Random Colors
float redX;
float greenX;
float blueX;

void setup() {
  size(500, 500);
  pos = new PVector(mouseX, mouseY, random(30, 70));
  acc = new PVector (5,5,0);
  background(0);
  
  float redX = random(255);
  float greenX = random(255);
  float blueX = random(255);
}

void draw() {
  if(mousePressed == true){
    noFill();
    stroke(redX,greenX,blueX,100);
    ellipse(pos.x, pos.y, pos.z, pos.z);
    point(pos.x, pos.y);
    
    pos.x = pos.x + acc.x;
    pos.y = pos.y + acc.y;
    
      if(pos.x > width-(pos.z/2) || pos.x < pos.z/2){
        acc.x = acc.x * -1;
      }
      
      if(pos.y > height-(pos.z/2) || pos.y < pos.z/2){
        acc.y = acc.y * -1;
      }
  }
}

void mousePressed(){
  pos = new PVector(mouseX, mouseY, random(40, 70));
  redX = random(255);
  greenX = random(255);
  blueX = random(255);
}

void keyPressed() {
  background(0);
}
