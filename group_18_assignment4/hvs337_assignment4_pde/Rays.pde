class Rays{
  float startX, startY, angle, speed;
  color start_color, end_color;
  
  Rays(float startX, float startY, float angle, float speed){
    this.angle = angle;
    this.startX = startX;
    this.startY = startY;
    this.speed = speed;
    start_color = color(255, 200, 63);
    end_color = color(255, 72, 0);
  }
  
  void display(){
    rectMode(CENTER);
    pushMatrix();
    rotate(angle);
    translate(0,0);
    for (int i = 0; i < 9; i++){
    rect(startX, startY, 10, 50, 28);
    rotate(PI/4.0);
    }
    popMatrix();
    angle += 0.01;
    }
  }
