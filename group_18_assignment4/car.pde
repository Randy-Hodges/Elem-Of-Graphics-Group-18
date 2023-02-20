class Wheel{
  // loads the wheel illustration
  PShape wheelSvg = loadShape("images/wheel.svg");
  float d;
  float x;
  float y;
  float turn;

  Wheel(float x, float y, float d){
    this.x = x; // where the wheel will be drawn
    this.y = y; // where the wheel will be drawn
    this.d = d; //the diameter of the wheel
  }
  
  // determines direction that wheel rotates
  void roll(float d){
    d = constrain(d, -1, 1);
    turn += .01*PI*d;
  }
  
  // rotates and displays the wheel
  void display(){
    pushMatrix();
    translate(x, y);
    rotate(turn);
    shape(wheelSvg, 0, 0, d, d);
    popMatrix();
  }
}

class Car extends Wheel{
  
  // loads car body images
  PShape body = loadShape("images/Car Body.svg");
  PShape details = loadShape("images/Car Body details.svg");
  PShape metal = loadShape("images/Car Body metal.svg");
  float w; // car width
  
  // for the drive method
  PVector direction;
  float speed = 0;
  
  color c;
  color acc_c;
  
  
  Car(float x, float y, float w, color c){
    super(x, y, w/4.6);
    this.w = w;
    this.c = c;
    
    direction = new PVector(1, 0);
    direction.normalize();
    
    colorMode(HSB, 360, 100, 100);
    float hue = hue(c);
    float sat = saturation(c);
    float l = brightness(c);
    l = constrain(l, 0, 100);
    sat = constrain(sat, 0, 100);
    hue = constrain(hue, 0, 360);
    this.acc_c = color(hue, sat-20, l + 70);
    colorMode(RGB, 255);
  }
  
  // allows you to change the color of the car
  void changeColor(color c){
    this.c = c;
    colorMode(HSB, 360, 100, 100);
    float hue = hue(c);
    float sat = saturation(c);
    float l = brightness(c);
    l = constrain(l, 0, 100);
    sat = constrain(sat, 0, 100);
    hue = constrain(hue, 0, 360);
    this.acc_c = color(hue, sat-20, l + 70);
    colorMode(RGB, 255); 
  }
  
  // rotates wheels, and creates a loop of cars from left to right
  // lets you determine the speed of the car across the page
  void drive(float speed, float dir){
    this.speed = speed;
    this.speed = constrain(this.speed, 0, 5); // the speed limit
    super.roll(dir); // wheel direction
    
    if (x > width){
      x= 0;
    }
    if (x < 0){
      x= width;
    }
    x = x + direction.x * (speed * dir); 
  }
  
  // displays car
  // recolors car body based on color input
  void display(){
    body.disableStyle();
    fill(c);
    stroke(0);
    shape(body, x, y, w, w/2.5);
    
    details.disableStyle();
    fill(acc_c);
    noStroke();
    shape(details, x, y, w, w/2.5);
    
    shape(metal, x, y, w, w/2.5);
    
    pushMatrix();
    translate(x, y);
    rotate(turn);
    shape(wheelSvg, 0, 0, d, d);
    popMatrix();
    
    pushMatrix();
    translate(x + w/1.67, y);
    rotate(turn);
    shape(wheelSvg, 0, 0, d, d);
    popMatrix();
  } 
}
