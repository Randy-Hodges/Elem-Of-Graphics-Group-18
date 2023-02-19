Sun sun;
Rays rays;

void setup(){
  size(1000, 1000);
  smooth();
  sun = new Sun(0, 0, 0, 0, 100, 1,1);
  sun.startX = sun.startY = 0;
  sun.speed = 1;
  sun.radius = 100;
  
  rays = new Rays (300, 300, 1, 1);
  rays.startX = 0 + sun.startX;
  rays.startY = 80 + sun.startY;
  rays.speed = 1;
  rays.angle = 1;
}

void draw(){
  // center point of sun spinning in a circle
    translate(width/2, height/2);
    fill(0);
    ellipse(0, 0, 1, 1);
    
  // sun rotates around center point
  pushMatrix();
  sun.display();
  rays.display();
  popMatrix();
  
  
}
