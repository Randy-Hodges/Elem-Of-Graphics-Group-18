
class SpaceBody {
  
  // location of center
  float x;
  float y;
  float z;
  // textures
  PImage tex;
  PShape ball;
  // size
  int radius;
  // spin speed
  float angle = 0.0;
  float angleSpeed;
  
  SpaceBody(int radius, float angleSpeed) {
    noStroke();
    this.x = width/2;
    this.y = height/2;
    this.z = 0;
    this.tex = loadImage("moonHighDef.jpeg");
    this.radius = radius;
    this.ball = createShape(SPHERE, radius);
    ball.setTexture(tex);
    this.angleSpeed = angleSpeed;
    stroke(1);
  }
  
  SpaceBody(int radius, float angleSpeed, float x, float y, float z) {
    noStroke();
    this.x = x;
    this.y = y;
    this.z = z;
    this.tex = loadImage("moonHighDef.jpeg");
    this.radius = radius;
    this.ball = createShape(SPHERE, radius);
    this.ball.setTexture(tex);
    this.angleSpeed = angleSpeed;
    stroke(1);
  }
  
  void display() {

    pushMatrix();
    
    translate(cos(-this.angle/PI/2)*this.radius*8, 
              sin(-this.angle/PI/2)*this.radius, 
              sin(-this.angle/PI/2)*this.radius*8);
    rotateY(this.angle);
    this.angle += this.angleSpeed;
    shape(this.ball);
    
    popMatrix();
  }
}



class CenterSpaceBody {
  
  // location of center
  float x;
  float y;
  float z;
  // textures
  PImage tex;
  PShape centerSphere;
  // size
  int radius;
  // spin speed
  float angle = 0.0;
  float angleSpeed;
  // moon
  SpaceBody moon;
  float t = 0.0;
  
  CenterSpaceBody(int radius, float angleSpeed, float x, float y, float z) {
    noStroke();
    this.x = x;
    this.y = y;
    this.z = z;
    this.tex = loadImage("worldEarthTexture.jpeg");
    this.radius = radius;
    this.centerSphere = createShape(SPHERE, radius);
    centerSphere.setTexture(tex);
    this.angleSpeed = angleSpeed;
    
    moon = new SpaceBody(radius*11/36, angleSpeed/2, this.x, this.y, this.z);
    
    stroke(1);
  }
  
  void display() {

    pushMatrix();
    
    this.y += cos(t/360*2*PI)*5;
    t += 1;
    translate(this.x, this.y, this.z);
    rotateY(this.angle);
    this.angle += this.angleSpeed;
    shape(this.centerSphere);
    this.moon.display();
    
    popMatrix();
    
    
  }
  
  
}
