// This final project is an shooter game
// You are controlling the space ship on the bottom of the sketch and you can control it by moving the mouse left and right
// pressing the mouse button will shoot a laser form a ship
// Your goal is to shoot as many aliens as possible to prevent the aliens from reaching the end of the screen
// If 3 aliens reach the end of the screen the game ends

import processing.sound.*; // Uses the proccessing sound libary to make sounds
SoundFile pop;
PVector[] circle;
PVector[] bullet;

PImage ship; //Image from: https://www.pngfind.com/mpng/hRbRmJ_spaceship-pixel-art-spaceship-space-invaders-png-transparent/
PImage alien;//Image from: https://www.pngfind.com/mpng/ToiwRo_space-invaders-alien-png-photo-space-invaders-alien/
int total = 0;

float rectX = 500;
float moveX = 2;

int hit = 0;
int lives = 3;

float position = 999;

void setup(){
  size(600,700);
  pop = new SoundFile(this,"pop.mp3");// Source: https://www.youtube.com/watch?v=-alGcEs7XYo
  ship = loadImage("ship.png");
  alien = loadImage("alien.png");
  bullet = new PVector[999];
  circle = new PVector[999];
  for (int i=0; i<999; i++) {
    circle[i] = new PVector(random(50,width-50), 0, random(255));
  }
}

void draw(){
  noStroke();
  background(0);
  shoot();
  imageMode(CENTER);
  image(ship,mouseX,620,50,50);
  //fill(255,0,0);
  //rectMode(CENTER);
  //rect(mouseX,630,50,50);
  balls();
  cubeCounter();
  screenText();
}

void shoot(){
  fill(0,0,255);
  if(mousePressed){ 
    // code bellow is taken from DATT 2040 sketch lab practice, used to make the waves
      for(int i=0; i<width; i++){
        float mv = map(100, 10, width, 0.01, 0.5);
      
        float x = i;
        float y = mouseX + (sin((frameCount*0.1)+i*mv)*10);
        float y1 = mouseX + (sin((frameCount*0.5)+i*mv)*10);
        
        float newY = (y+y1)/2;
        ellipse(newY,x,10,10);
      }
    }
}

void balls(){
  fill(0,255,0);
  for (int i=0; i<total; i++) {
    image(alien,circle[i].x,circle[i].y,30,25);
    //ellipse(circle[i].x,circle[i].y,25,25);
    
    circle[i].y = circle[i].y + 5;
    
    if(circle[i].y > height){
      circle[i].y = 0;
      circle[i].x = random(width);
      lives = lives - 1;
    }
    
    if(lives == 0){
      circle[i].y = -100;
      circle[i].x = 999;
      moveX = 0;
    }
    
        
    if(mousePressed && mouseX > circle[i].x - 25 && mouseX < circle[i].x + 25){
       circle[i].y = -100;
       circle[i].x = random(50,width-50);
       hit = hit + 1;
       pop.play();
    }
  }
}

void cubeCounter(){
  rect(rectX,900,25,25);
  rectX = rectX + moveX;
  
  if(rectX > width || rectX < 0) {
    moveX *= -1;
    total += 1;
  }
}

void screenText(){
  fill(255);
  textSize(25);
  text("Hit:",20,20);
  text(hit,70,20); 
  text("Lives:",20,50);
  text(lives,90,50);
 
  if(lives == 0){
    text("You Hit:",240,350);
    text(hit,330,350);
    fill(255,0,0);
    textSize(50);
    text("GAME OVER!!",170,300);
  }
}
