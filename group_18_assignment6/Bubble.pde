
// F_{b} = - p * g * V
//F_{b}  =  buoyant force
//rho  =  fluid density
//g  =  acceleration due to gravity
//V  =  fluid volume

class Bubble {
  //PShape bubbleSVG = loadShape("Bubble-459842357437834567.svg");
  PShape bubbleSVG = loadShape("fewBubbles.svg");
  float x;
  float y;
  float diameter;
  float direction;
  float popHeight;
  float bubbleScale;
  
  // gravity
  float g = 9.81; // m/s^2
  
  
  // bubble buoyancy
  float bubblePressure;
  float rho = 1.2; // kg/m^3
  float volume; 
  // water pressure
  float waterPressure;
  float rhoWater = 1000; // kg/m^3 
  // air bubble weight due to gravity
  float bubbleGrav;
  
  Bubble(float x, float y) {
    this.x = x;
    this.y = y;
    this.direction = random(-1, 1);
    if (direction < 0) {
      this.direction = -1;
    } else {
      this.direction = 1;
    }
    
    this.bubbleScale = random(0.010, 0.04);
    this.diameter = 800 * this.bubbleScale;
    this.volume = PI * pow( (diameter/2), 2);
    this.bubbleGrav = this.rho * this.volume;
    this.popHeight = poppingHeight();
  }
  
  void displayBubble() {
    pushMatrix();
    translate(x,y);
      pushMatrix();
      scale(bubbleScale);
      rotate(radians(10*direction));
      shape(bubbleSVG, 0, 0);
      popMatrix();
    popMatrix();
  }
  
  
  void bubbleMoves () {
    
    this.waterPressure =  waterPressureCalc();
    this.bubblePressure =  0.000005 * rho * volume * g;
    
    this.y = this.y - this.waterPressure + this.bubblePressure;
    this.x += direction;
    if (this.y <= popHeight) {
      this.y = height;
    }
    if (this.x < 0) {
      this.x = width;
    }
    if (this.x > width) {
      this.x = 0;
    }
    
  }
  
  void bubblesTouch (Bubble otherBubble) {
    float radiusOne = this.diameter/2;
    float radiusTwo = otherBubble.diameter/2;
    
    float distanceBetween = sqrt(sq(this.x - otherBubble.x) 
                               + sq(this.y - otherBubble.y));
    
    // bubbles bounce off each other if intersect
    if (distanceBetween < radiusOne+radiusTwo) {
      if (this.direction == -1) {
        this.direction = 1;
      } else {
        this.direction = -1;
      }
      
    } 
  }
  
  float waterPressureCalc() {
    float calc = 0.0000005 * g * rhoWater * y;
    return calc;
  }
  
  // popping height based upon size of bubble
  // smaller bubbles float higher
  float poppingHeight() {
     float calc = ( ( 1 - (0.04-this.bubbleScale) / 0.03)
                    * (2*height/5 - height/15) + height/15 );
     return calc;
  }
  
}
