class Ball { // incorporate this with Taylor's code
  
  int x, y, d, speed;
  
  Ball(int initial_x, int initial_y){
    this.x = initial_x;
    this.y = initial_y;
    d = 5;
    speed = 15;
  }
  
  void addBall(){
    circle(x, y, d);
  }
  
  void move(){
    y -= speed;
  }
  
  
  }
  
  
