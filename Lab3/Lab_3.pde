//This project is a series of sin waves move across the screen
//The sin waves will change its size based on the x and y location of the mouse
//If the mouse is on the left the mouse is the smaller the waves, if the mouse is on the right the bigger the waves
//This code uses a modified code from the 2040 github

void setup() {
  size(600,300);
}

void draw() {
  background(0);
  
  for(int i=0; i<width; i++){
    float mv = map(mouseX, 0, width, 0.01, 0.5);
    
    float x = i;
    float y = height/2 + (sin((frameCount*0.1)+i*mv)*mouseX);
    float y1 = height/2 + (sin((frameCount*0.5)+i*mv)*10);
    
    float newY = (y+y1)/2;
    
    // Horizontal Lines
    noStroke();
    fill(x,y,x);
    ellipse(x,newY - 50,10,10);
    
    fill(x,y,x);
    ellipse(x,newY + 50,10,10);
    
    //Verticle Line
    noStroke();
    fill(x,y,x);
    ellipse(newY,x,10,10);
    
    fill(x,y,x);
    ellipse(newY + 250,x,10,10);
  }
}
