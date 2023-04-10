class Dodgeball{
  
  // colors
  color side1Color = #BF4343;
  color side2Color = #9CC6A9;
  color deadColor = #DED9C7; 
  color currentColor = deadColor;
  // Physics
  PVector pos;
  PVector vel;
  float mass = 146;
  float r = 25;
  float launch_speed = 10;
  float dead_speed = 1;
  // team stuff
  boolean isPlayerBall; // Changes in pickUp function
  Boolean isPossessed = false; // other classes need to flip this switch
  Boolean dead = true;
  
  Dodgeball(float x, float y){
    pos = new PVector(x, y);
    vel = new PVector();
  }

  void update(){
    move();
    applyBounce();
    updateAllegiance();
    display();
  }
  
  void move(){
    if (isPossessed == false){ 
      vel.x -= (.006*vel.x);
      vel.y -= (.006*vel.y);
      pos.x += vel.x;
      pos.y += vel.y;  
    }
    if (vel.mag() < dead_speed){
      dead = true;
    }
  }
  
  void applyBounce(){
    // top/bottom
    if (pos.y > (height - r) || pos.y < r){
      vel.y = -vel.y;
      dead = true;
    }
    // sides
    if (pos.x > (width - r) || pos.x < r){
      vel.x = -vel.x;
      dead = true;
    }
  }
  
  void updateAllegiance(){
    if (dead){
      currentColor = deadColor;
    } else {
      if (isPlayerBall){
        currentColor = side1Color;
      }
      else{
        currentColor = side2Color;
      }
    }
  }

  boolean intersect(float x, float y){
    return pos.dist(new PVector(x, y)) < r;
  }

  boolean intersect(PVector other_pos){
    return pos.dist(other_pos) < r;
  }

  void launch(PVector direction){
    // direction: a vector representing the direction the ball needs to travel
    // ex: For player, mousePos.sub(player position)
    vel = direction.copy().normalize().mult(launch_speed);
    isPossessed = false;
    dead = false;
  }
  
  void pickUp(boolean isPlayerBall){
    this.isPlayerBall = isPlayerBall;
    dead = false;
    isPossessed = true;
  }
  
  void display(){
    pushMatrix();
    translate(pos.x, pos.y);
    fill(currentColor);
    ellipse(0, 0, r, r);
    popMatrix();
    
  }
}