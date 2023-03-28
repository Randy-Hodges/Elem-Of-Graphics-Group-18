class Plankton{ 
  
  int[][] current;
  int south = 0;
  int east = 1;
  int north = 2;
  int west = 3;
  int step;
  
  //color on = color(#5E7740); // plankton
  //color off = color(#B7A08F); 
  
  int on = 1;
  int off = 0;

  int dir = north;
  int x, y, w, h;
  int territoryX, territoryY;
  PShape plankton;

  Plankton(int x, int y, int step, int territoryX, int territoryY, int w, int h){
  this.x = x;
  this.y = y;
  this.step = step;
  this.territoryX = territoryX;
  this.territoryY = territoryY;
  this.w = w;
  this.h = h;
  current = new int[h][w];
  for (int i=0; i < h; i++){
    for (int j=0; j < w; j++){
        current[i][j] = 0;
      }
    }
     current[y][x] = on;
  }
  

void move(){
  
  if (dir == south){
    y += step;
    if (y >= h-1){
      y = 0;
    }
  } else if (dir == east){
    x += step;
    if (x >= w-1){
      x = 0;
    }
  } else if (dir == north){
    y -= step;
    if (y > h){
      y = h - 1;
    }
  } else if (dir == west){
    x -= step;
    if (x < 1){
      x = w - 1;
    }
  }
  turn();
}

void turn(){
  if (current[y][x] == on){
    current[y][x] = off;
    
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
    
  } else if (current[y][x] == off) {
    current[y][x] = on;
    
    // rule 2
    if (dir == north) {
      dir = south;
    } else {
      dir = dir + 1; 
    }
  }
  
  }
  
  void display(){
    pushMatrix();
      translate(w, h);
      pushMatrix();
      fill(#5E7740);
      noStroke();
      ellipse(x, y, 5, 5);
      //plankton = loadShape("pictures/Plankton.svg");
    popMatrix();
    popMatrix();
  }
  
 
  
    
}
