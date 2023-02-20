class Rays{
  float startX, startY, angle, rect_width, translateX;
  color start_color, end_color;
  
  Rays(float startX, float startY, float angle, float rect_width, float translateX){
    this.angle = angle;
    this.startX = startX;
    this.startY = startY;
    this.rect_width = rect_width;
    this.translateX = translateX;
    start_color = color(255, 200, 63);
    end_color = color(255, 72, 0);
  }
  
  void display(){
    rectMode(CENTER);
    pushMatrix();
    rotate(angle);
    translate(translateX,500);
    for (int i = 0; i < 9; i++){
    rect(startX, startY, rect_width, 50, 28);
    rotate(PI/4.0);
    }
    popMatrix();
    angle += 0.000001;
    if (rect_width > 0){
    rect_width = rect_width - 0.01;
    }
    if (translateX > 0){
      translateX = translateX - 0.5;
    }
    }
  }
