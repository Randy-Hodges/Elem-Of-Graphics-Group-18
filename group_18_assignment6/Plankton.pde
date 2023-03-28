class Plankton{ 
  
  int south = 0;
  int east = 1;
  int north = 2;
  int west = 3;
  int step;

  color on = color(#5E7740); // plankton
  color off = color(#B7A08F); 

  int dir = north;
  int x;
  int y;

  Plankton(int x, int y, int step){
  this.x = x;
  this.y = y;
  this.step = step;
  }

void move(){
  
  if (dir == south){
    y -= step;
  } else if (dir == east){
    x += step;
  } else if (dir == north){
    y += step;
  } else if (dir == west){
    x -= step;
  }
  turn();
}

void turn(){
  if (get(x, y) == on){
    pixels[y*width+x] = off;
    
    dir = (dir - 1) % 4;
    
    if (dir == -1){
      dir = 3;
    }
    
    // rule 1
    if (dir == south){
      dir = west;
    } else {
      dir = dir - 1;
    }
    
  } else if (get(x, y) == off) {
    set(x, y, color(on));
    
    // rule 2
    if (dir == west) {
      dir = south;
    } else {
      dir = dir + 1; 
    }
  }
  
  }
  
  void display(){
    fill(#5E7740);
    noStroke();
    ellipse(x, y, 5, 5);
  }
  
 
  
    
}

