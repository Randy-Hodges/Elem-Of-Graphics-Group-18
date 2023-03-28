class Plankton{ 
  
  int south = 0;
  int east = 1;
  int north = 2;
  int west = 3;

  color on = color(#92B4A7); //
  color off = color(#D1F0B1); //

  int dir = north;
  int x;
  int y;

  Plankton(int x, int y){
  this.x = x;
  this.y = y;
  }

// no wrap around
void move(){
  if (dir == south){
    y ++;
    if (y == height/2){
      
    }
  }
  else if (dir == east){
    x++;
  }
  else if (dir == north){
    y --;
  }
  else if (dir == west){
    x --;
  }
}

void turn(){
  if (get(x, y) == on){
    set(x, y, off);
    
    dir = (dir - 1) % 4;
    if (dir < 0){
      dir += 4;
    }
    
    if (dir == south){
      dir = west;
    } else {
      dir = dir - 1;
    } 
    
  } else {
    set(x, y, on);
    dir = (dir + 1) % 4;
    
  
  if (dir == west) {
    dir = south;
  } else {
    dir = dir + 1; 
  }
  }
  
  }
  
 /* void turn(){
   if (get(x,y) == on){
     set(x, y, off);
     
     dir = Math.floorMod(dir - 1, 4);
   } else {
     set(x, y, on);
     dir = (dir + 1)%4;
   }
 }*/
  
    
}
