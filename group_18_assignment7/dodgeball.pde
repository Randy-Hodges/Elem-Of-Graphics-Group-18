class Dodgeball{
  
  color side1Color = #BF4343;
  color side2Color = #9CC6A9;
  color deadColor = #DED9C7; 
  color currentColor = deadColor;
  String allegiance;
  String enemy;
  String side1;
  String side2;
  PVector pos;
  PVector vel;
  float mass = 146;
  float r;
  float ballX;
  float ballY;
  float centerline;
  Boolean isPossessed = false;
  Boolean dead = true;
  float followX;
  float followY;
  
  Dodgeball(float x, float y, float vx, float vy, float r, String side1, String side2){
    pos = new PVector(x, y);
    vel = new PVector(vx, vy);
    this.r = r;
    this.side1 = side1;
    this.side2 = side2;
  }
  
  boolean intersect(float x, float y){
    float disX = ballX - x;
    float disY = ballY - y;
    
    if (sqrt(sq(disX) + sq(disY)) < r){
      return true;
    } else {
      return false;
    } 
  }
  
  PVector position(){
    return pos;
  }
  
  void launch(float x, float y, float vx, float vy){
    if (isPossessed == true){
      pos = new PVector(x, y);
      vel = new PVector(-vx, -vy);
    }
    isPossessed = false;
    dead = false;
    ballX = pos.x;
    ballY = pos.y;
  }
  
  void pickUp(float x, float y, String allegiance){
    this.allegiance = allegiance;
    dead = false;
    isPossessed = true;
    ballX = x;
    ballY = y+10;
    vel.y = -vel.y;
  }
  
  void applyFriction(){
    if (isPossessed == false){ 
      vel.x -= (.006*vel.x);
      vel.y -= (.006*vel.y);
      pos.x += vel.x;
      pos.y += vel.y;  
      ballX = pos.x;
      ballY = pos.y;
    }
  }
  
  void applyBounce(){
    if (pos.y > (height - r) || pos.y < r){
      vel.y = -vel.y;
      dead = true;
    }
    
    if (pos.x > (width - r) || pos.x < r){
      vel.x = -vel.x;
      dead = true;
    }
    
    ballX = pos.x;
    ballY = pos.y;
    
  }
  
  void showAllegiance(){
    if (dead == true){
      currentColor = deadColor;
    } else {
      if (allegiance == side1){
        currentColor = side1Color;
      }
      
      if (allegiance == side2){
        currentColor = side2Color;
      }
    }
  }

  //void setCourt(float centerline){
  //  this.centerline = centerline;
  //}
  
  //void setAllegiance(String allegiance, String enemy, color allyColor, color enemyColor){
  //  side1 = allegiance;
  //  side2 = enemy;
  //  this.allegiance = allegiance;
  //  this.enemy = enemy;
  //}
  
  //void changeAllegiance(){
  //}
  
  //void setAwareness( ){
  //}
  
  //void target(float targetX, float targetY){
  //}
  
  //void launchBall(){
  //}
  
  void display(){
    pushMatrix();
    translate(ballX, ballY);
    fill(currentColor);
    ellipse(0, 0, 30, 30);
    popMatrix();
    
  }
}
