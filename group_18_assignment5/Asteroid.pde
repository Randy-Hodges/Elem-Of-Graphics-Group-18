class Asteroid{
  
  // load obj
  PShape asteroid = loadShape("Asteroid.obj");
  float theta, theta2, theta3, scale;
  float xpos, ypos;
  
  // rocks
  PShape rock1 = loadShape("rock1.obj");
  PShape rock2 = loadShape("rock2.obj");
  PShape rock3 = loadShape("rock3.obj");
  
  Asteroid(float xpos, float ypos){
  this.xpos = xpos; // x position
  this.ypos = ypos; // y position
 
  }
  
  void displayAsteroid(float scale){
  // all obj's drifting
  pushMatrix();
  translate(xpos, ypos);
  xpos += 1;
  
  // asteroid
    pushMatrix();
    scale(scale);
    rotateY(-theta/2);
    rotate(theta);
    shape(asteroid);
    popMatrix();
    
      // rock1
      pushMatrix();
      scale(scale);
      rotateX(theta);
      rotate(theta);
      shape(rock1, 3, 3);
      popMatrix();
      
      // rock 2
      pushMatrix();
      scale(scale);
      rotate(theta2);
      shape(rock2, -4, -4);
      popMatrix();
      
      // rock 3
      pushMatrix();
      scale(scale);
      rotateZ(theta3);
      shape(rock3, 1, -3);
      popMatrix();
  
  theta += 0.01;
  theta2 += 0.03;
  theta3 -= 0.02;
  popMatrix();
  }
 
}
 
