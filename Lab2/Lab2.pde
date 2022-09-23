PVector pos;
PVector acc; 

void setup() {
  size(500, 500);
  pos = new PVector(mouseX, mouseY, random(30, 70));
  acc = new PVector (random(-5,5),random(-5,5),0);
  background(0);
 
}

void draw() {
  if(mousePressed == true){
    noFill();
    stroke(random(255),random(255),random(255),100);
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
}

void keyPressed() {
  background(0);
}
