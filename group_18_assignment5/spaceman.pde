class SpaceShip{
  
  PShape Ship;
  PImage ShipSkin;
  float h;
  float x;
  float y;
  float z;
  float origin_x;
  float origin_y;
  float osc_y = 0.0;
  float osc_x = 0.0;
  float range;
  float start;
  
  SpaceShip(float x, float y, float z, float h){
    this.x = x;
    this.y = y;
    this.z = z;
    origin_x = x;
    origin_y = y;
    this.h = h;
    
    // uploads the skin and creates main model for the spaceship
    noStroke();
    Ship = createShape(SPHERE, h);
    ShipSkin = loadImage("objects/space_man/SpaceShipSkin.png");
    Ship.setTexture(ShipSkin);
  }
  
  void bob(float max, float start){
    y = (max)*sin(start + osc_y)+ (origin_y - (h/2));
    osc_y += .01*PI;
  }
  
  void drift(float range){
    this.range = (range/2);
    x = this.range*sin((PI/2) + osc_x) + (origin_x - this.range);
    osc_x += .001*PI; 
  }
  
  void display(){
    pushMatrix();
    shape(Ship, x, y, h, h); 
  }
}

class SpaceMan extends SpaceShip{
  
  PShape man;
  float trail;
  float turn = 0.0;
  float dir = 0.0;
  float follow_x;
  float follow_y;
  float follow_z;
  
  SpaceMan(float x, float y, float z, float h, float trail){
    super(x, y, z, h);
    
    // uploads space man OBJ
    man = loadShape("objects/space_man/SpaceManModel.obj"); 
    this.trail = trail;
    follow_x = x + trail;
    follow_y = y;
    follow_z = z + 100;  
  }
  
  void drift(float range){
    // horizontal oscillation of the spaceman
    super.drift(range);
    follow_x = (this.range)*sin((PI/2) + osc_x) + trail;
    osc_x += .001*PI; 
  }
  
  void bob(float max, float start){
    // vertical oscillation of the spaceman
    super.bob(max, start);  
    follow_y = (.75*max)*sin((this.start - PI/2) + osc_y/1.25) - h;
  }
  
  void roll(){
    // oscillates the rotation of the spaceman
    float change = 1;
    turn += sin(PI*.008) * sin(PI*dir*change);
    dir += .001;
  }
    
  void display(){
    
    fill(#4DF0F5, 50);
    stroke(#4DF0F5);
    
    // creates the beam
    beginShape(TRIANGLES);
    vertex(x, y - h/2, z);
    vertex( follow_x + x, follow_y + y, follow_z - 1);
    vertex( follow_x + x, follow_y + y + 20,  follow_z -1 );
    
    vertex(x, y - h/2, z);
    vertex( follow_x + x, follow_y + y + 20, follow_z - 1);
    vertex( follow_x + x + 20, follow_y + y + 20,  follow_z - 1);
    
    vertex(x, y - h/2, z);
    vertex( follow_x + x + 20, follow_y + y + 20,  follow_z - 1);
    vertex( follow_x + x + 20, follow_y + y,  follow_z - 1);
    
    vertex(x, y - h/2, z);
    vertex( follow_x + x + 20, follow_y + y,  follow_z - 1);
    vertex( follow_x + x, follow_y + y, follow_z - 1);
    
    endShape();
  
    noStroke();
    
    // places the ship
    pushMatrix();
    translate(x, y, z);
    shape(Ship, 0, 0, h, h);
    
     // places the space man
    pushMatrix();
    translate(follow_x, follow_y, follow_z - z);
    rotate(turn);
    rotateZ(PI);
    scale(35);
    shape(man, 0, 0, man.width, man.height);
    scale(1);
    popMatrix();
    popMatrix();
  }
}
