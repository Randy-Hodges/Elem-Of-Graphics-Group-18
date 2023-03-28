Plankton p1;
Plankton p2;
// Plankton[] plankton;
// int num_plankton = 3;

void setup(){
  size (1000, 1000);
  
  /*void createPlankton(){
    plankton = new Plankton[num_minnows];
    for (int i = 0; i < plankton.length; i++){
        plankton[i] = new Plankton();
    } 
}*/

  p1 = new Plankton(0, 150, 1, 1000, 0, 800, 500);
  p2 = new Plankton(0, 200, 1, 1000, 0, 800, 500);
}

void draw(){
  background(#B7A08F);
 
  p1.move();
  p1.display();
  
  p2.move();
  p2.display();
  
}
