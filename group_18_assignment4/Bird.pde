
class Bird {
  // for location purposes
  float x;
  float y;
  
  // for size of birds
  float birdSize;
  
  float birdBodY;
  float birdBodX;
  
  float headCenterX;
  float headCenterY;
  float headDiam;
  
  float tailX;
  float tailY;
  float wingBackX;
  float wingBackY;
  
  float movingWingVertexX;
  float movingWingVertexY;
  
  Bird(float x, float y, float birdSize) {
    this.x = x;
    this.y = y;
    this.birdSize = birdSize;
    this.movingWingVertexY = y - 2*birdSize/3;
    this.birdBodX = birdSize;
    this.birdBodY = 2*birdSize/3;
    
  }
  
  void display() {
    
    fill(110, 198, 155);
    // bird wing back
    wingBackX = x + 0.35* birdBodX;
    wingBackY = y;
    movingWingVertexX = wingBackX;
    triangle(wingBackX, wingBackY, movingWingVertexX, movingWingVertexY, x-0.35*birdBodX, wingBackY);
    // bird tail
    tailX = x - (birdSize*3/10);
    tailY = y + (birdBodY * 1/3);
    triangle(tailX, tailY, tailX-(birdBodX*.3), tailY-(birdBodY*.8), tailX-(birdBodX*.6),  tailY-(birdBodY*.6));
    
    fill(132, 237, 185);
    // bird body
    ellipse(x, y, birdBodX, birdBodY);
    
    // bird wing front
    triangle(x + 0.1*birdBodX, wingBackY-0.4*birdBodY, x-birdBodX*0.8, movingWingVertexY, x-birdBodX*0.4,wingBackY);
    
    // bird head
    headCenterX = x + (birdSize*2/5);
    headCenterY = y - (birdBodY * 1/3);
    headDiam = birdSize/2;
    circle(headCenterX, headCenterY, headDiam);
    
    // bird eyes
    fill(0);
    circle(headCenterX, headCenterY-headDiam*0.01, headDiam*0.2);
    fill(255);
    circle(headCenterX, headCenterY-headDiam*0.02, headDiam*0.1);
    
    fill(250, 233, 73);
    // bird upper beak
    triangle(headCenterX+0.25*headDiam, headCenterY+0.1*headDiam, 
             headCenterX+ 0.85*headDiam, headCenterY+0.1*headDiam, 
             headCenterX + 0.45*headDiam, headCenterY - headDiam*0.18);
    // bird lower beak
    triangle(headCenterX+0.25*headDiam, headCenterY+0.1*headDiam, 
             headCenterX+ 0.75*headDiam, headCenterY+0.1*headDiam, 
             headCenterX + 0.45*headDiam, headCenterY + headDiam*0.22);
  }
  
  void move(float time, float screenSize) {
    if (time%2 == 0) {
      this.x += 1;
    }
    this.y += cos(time/45 * PI) * 2/10;
    this.movingWingVertexY -= cos(time/45 * PI);
    if(x > screenSize+birdSize*2) {
      x = -birdSize*1.2;
    }
    
  }
  
  
  float wingFlap(float speed) {
    speed += 1;
    return cos(speed/45 * PI) * 2/10;
  }
  
  
}
