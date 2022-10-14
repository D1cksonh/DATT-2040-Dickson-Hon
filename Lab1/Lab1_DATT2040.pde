//Modified code from the 2040 github

int col = 25;
int row = 25;

//Variabels for the amount of circles
int stepX, stepY;

//Variables for the counter
float circleX = 2;
float speedX = 20;

void setup() {
 size(500,500);
 
 stepX = width/col;
 stepY = height/row;
 
 background(35);
}

void draw() {
  //Counter for when the cirlces change color
  ellipse(circleX,999,50,50);
  circleX = circleX + speedX;
  
  //When the counter hits a certain number, the colors of the cirlces will change
  if(circleX > width || circleX < 0) {
    speedX = speedX * -1;
    
    //Changing the grid colors of the 
    for(int i=0; i<col; i++){
      for(int j=0; j<row; j++){
     
       float x = i * stepX;
       float y = j * stepY;
       
       if(random(1) > 0.5){
         fill(random(255),random(255),random(255));
        }else{
         fill(0);
       }
       
       noStroke();
       ellipse(x,y,stepX,stepY); 
       }
     }
  }
}
