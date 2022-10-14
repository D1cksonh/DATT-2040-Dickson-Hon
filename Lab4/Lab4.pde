//Balls Variables
PVector[] balls;
PVector[] acc; 

PVector[] balls2;
PVector[] acc2; 

//Mouse Variables
boolean distance = false;
float sizeX = 25;
float sizeY = 25;

float speed = 3;

//Num of circles
int num = 10;
int num2 = num*2;

int scoreNum = 0;

void setup() {
  size(800, 800);
  
  //create new 
  balls = new PVector[num];
  acc = new PVector [num];

  balls2 = new PVector[num2];
  acc2 = new PVector [num2];
 
 //Populate
  for (int i = 0; i < num; i++) {
    balls[i] = new PVector(random(width), random(height), random(5, 70));
    acc[i] = new PVector (random(-speed,speed),random(-speed,speed),0);
  }
  
  for (int j = num; j < num2; j++) {
    balls2[j] = new PVector(random(width), random(height), random(5, 70));
    acc2[j] = new PVector (random(-speed,speed),random(-speed,speed),0);
  }
}

void draw(){
  background(0);
  makeRedBalls();
  makeBlueBalls();
  userMouse();
  screenText();
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
        sizeX += 5;
        sizeY += 5;
        scoreNum += 1;
    }
  }
  
  for (int j=num; j<num2; j++) {
    distance = balls2[j].dist(mouseballs) < 75; 
    
    if (distance){
        balls2[j].x = random(width);
        balls2[j].y = random(height);
        sizeX -= 5;
        sizeY -= 5;
        scoreNum -= 1;
    }
  }
}

void makeRedBalls() {
  for(int i=0; i<num; i++) {
    noStroke();
    fill(255,0,0);
    ellipse(balls[i].x,balls[i].y,25,25);
    balls[i].add(acc[i]);
    
    if(balls[i].x > width-(balls[i].z/2) || balls[i].x < balls[i].z/2){
      acc[i].x = acc[i].x * -1;
    }
    
    if(balls[i].y > height-(balls[i].z/2) || balls[i].y < balls[i].z/2){
      acc[i].y = acc[i].y * -1;
    }
  }
}

void makeBlueBalls() {
  for(int j=num; j<num2; j++) {
    noStroke();
    fill(0,0,255);
    ellipse(balls2[j].x,balls2[j].y,25,25);
    balls2[j].add(acc2[j]);
    
    if(balls2[j].x > width-(balls2[j].z/2) || balls2[j].x < balls2[j].z/2){
      acc2[j].x = acc2[j].x * -1;
    }
    
    if(balls2[j].y > height-(balls2[j].z/2) || balls2[j].y < balls2[j].z/2){
      acc2[j].y = acc2[j].y * -1;
    }
  }
}

void screenText(){
  textSize(25);
  text("Size:",50,50);
  text(scoreNum,100,50);
}
