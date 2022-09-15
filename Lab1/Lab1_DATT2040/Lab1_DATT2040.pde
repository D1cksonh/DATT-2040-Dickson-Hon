float x = 0;
float y = 0;
float redX = 50;
float greenX = 50;
float blueX = 50;

void setup(){
  size(800,800);
  rectMode(CENTER);
  background(0);
}

void draw() {
  if(mousePressed == true){
    //RNG color
    redX = random(255);
    greenX = random(255);
    blueX = random(255);
    
    //Horizontal Box
    noStroke();
    fill(redX,greenX,blueX);
    rect(mouseX,mouseY,x,25);
    x += 2;
    
    //Verticle Box
    noStroke();
    fill(redX,greenX,blueX);
    rect(mouseX,mouseY,25,y);
    y += 2;
  }
  
  //Stop Making Bars
  if(mousePressed == false) {
    x = 0;
    y = 0;
  }
  
  //Reset Background
  if(keyPressed && key == '1'){
    background(0);
  }
}
