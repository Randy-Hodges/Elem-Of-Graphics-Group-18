
class Shark{
  
  int[][] current;
  int[][] future;
  int worldWidth;
  int worldHeight;
  int xPos;
  int yPos;
  float followX;
  float followY;
  float worldX;
  float worldY;
  int direction;
  int step;
  float easing = 0.02;
  float MARGIN_CONSTANT = .8;
  PShape sharkSVG;
  float shark_width = 250, shark_height = 150;
  
  Shark(int xPos, int yPos, String pointed, int worldX, int worldY, int worldWidth, int worldHeight, int direction, int step){
    this.xPos = xPos;
    this.yPos = yPos;
    followX = xPos;
    followY = yPos;
    this.worldWidth = worldWidth;
    this.worldHeight = worldHeight;
    this.worldX = worldX;
    this.worldY = worldY;
    this.direction = direction;
    this.step = step;
    current = new int[worldHeight][worldWidth];
    future = new int[worldHeight][worldWidth];
    
    if (pointed == "RIGHT"){
      sharkSVG = loadShape("pictures/sharkSVGs/Shark_right.svg");
    } else {
      sharkSVG = loadShape("pictures/sharkSVGs/Shark.svg");
    }
    
    // set all to 0
    for (int i=0; i < worldHeight; i++){
      for (int j=0; j < worldWidth; j++){
        current[i][j] = 0;
        future = current;
      }
    }
    
    // set the initial position to 1 (or black)
    current[yPos][xPos] = 1;
  }
  
  PVector getSharkPosition(){
    return new PVector(worldX + followX + shark_width/2, worldY + followY + shark_height/2);
  }
  
  void changeDirection(){
    if (current[yPos][xPos] == 0){
      direction = (direction-1)%4;
      if (direction == -1){
        direction = 3;
      }
    } else {
      direction += 1;
      if (direction == 4){
        direction = 0;
      }
    }
  }
  
  void changeState(){
    if (current[yPos][xPos] == 0){
      current[yPos][xPos] = 1;
    } else {
      current[yPos][xPos] = 0;
    }
  }

  void swim(){
    changeDirection();
    changeState();
    
    if (direction == 0){
      yPos += step;
    } else if (direction == 1){
      xPos -= step;
    } else if (direction == 2){
      yPos -= step;
    } else if (direction == 3){
      xPos += step;
    }
    
    if (xPos > (worldWidth - 100)){
      xPos = int(random(1, worldWidth - 1));
    } else if (xPos < 1){
      xPos = int(random(1, worldWidth - 1));
    }
    
    if (yPos > (worldHeight - 300)){
      yPos = 1;
    } else if (yPos < 1){
      yPos = worldHeight - 2;
    }
  }
  
  void display(){
    followX += lerp(0, xPos - followX, easing);
    followY += lerp(0, yPos - followY, easing);
    // Used for checking actual position and hitboxes
    // fill(0);
    // ellipse(worldX + followX, worldY + followY, 20, 20);
    // ellipse(worldX + followX + shark_width/2, worldY + followY + shark_height/2, shark_width, shark_height);
    pushMatrix();
    translate(worldX, worldY);
    pushMatrix();
    translate(followX, followY);
    scale(.4);
    shape(sharkSVG, 0, 0);
    popMatrix();
    popMatrix();
    
  }
}
