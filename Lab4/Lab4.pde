//Balls Variables
PVector[] balls;
PVector[] acc; 

//Mouse Variables
boolean distance = false;
float sizeX = 25;
float sizeY = 25;

float speed = 3;
float speedChange = -1;
float difficulty = 10;

//Num of circles
int num = 25;

int scoreNum = 0;

void setup() {
  size(800, 800);
  
  //create new 
  balls = new PVector[num];
  acc = new PVector [num];
 
 //Populate
  for (int i = 0; i < num; i++) {
    balls[i] = new PVector(random(width), random(height), random(5, 70));
    acc[i] = new PVector (random(-speed,speed),random(-speed,speed),0);
  }
}

void draw(){
  background(0);
  makeBalls();
  userMouse();
  //score();
}

void userMouse(){
  PVector mouseballs = new PVector(mouseX,mouseY);
  fill(0,255,0);
  rectMode(CENTER);
  rect(mouseX,mouseY,sizeX,sizeY);
  
  for (int i=0; i<num; i++) {
    distance = balls[i].dist(mouseballs) < 75; 
    
    if (distance){
        balls[i].x = random(width);
        balls[i].y = random(height);
        sizeX += 1;
        sizeY += 1;
        scoreNum += 1;
    }
  }
}

void makeBalls() {
  for(int i=0; i<num; i++) {
    noStroke();
    fill(random(255),random(255),random(255));
    ellipse(balls[i].x,balls[i].y,25,25);
    balls[i].add(acc[i]);
    
    if(balls[i].x > width-(balls[i].z/2) || balls[i].x < balls[i].z/2){
      //acc[i].x = acc[i].x * speedChange;
      acc[i].x = acc[i].x * -1;
    }
    
    if(balls[i].y > height-(balls[i].z/2) || balls[i].y < balls[i].z/2){
      //acc[i].y = acc[i].y * speedChange;
      acc[i].y = acc[i].y * -1;
    }
  }
}

//void score() {
//  fill(255);
//  text(scoreNum, 40, 120); 
//  if(scoreNum == difficulty){
//    difficulty = difficulty + 10;
//    speedChange = speedChange * 2;
//  }
//}
