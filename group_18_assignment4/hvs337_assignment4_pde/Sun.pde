class Sun{
 float startX, endX, startY, endY, radius, speed, angle;
 color start_color, end_color;

 Sun(float startX, float endX, float startY, float endY, float radius, float speed, float angle){
   this.startX = startX;
   this.endX = endX;
   this.startY = startY;
   this.endY = endY;
   this.radius = radius;
   this.speed = speed;
   this.angle = angle;
   start_color = color(255, 200, 63);
   end_color = color(255, 72, 0);
 }
 
  void display(){
    background(255);
    ellipseMode(CENTER);
    
    // sun moves around center point
     rotate(angle);
     translate(50,0);
     fill(lerpColor(start_color, end_color, (millis()%9000)/9000.0) );
     noStroke();
     ellipse(startX, startY, radius, radius);
     angle += 0.01;
 }
}
