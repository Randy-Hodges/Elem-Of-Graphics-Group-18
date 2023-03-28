Plankton p1;
Plankton p2;

void setup(){
  size (500, 500);
  
  p1 = new Plankton(150, 150);
  p2 = new Plankton(250, 300);
}

void draw(){
  background(0);
  
  p1.move();
  p1.turn();
  
  p2.move();
  p2.turn();
 
  
}
