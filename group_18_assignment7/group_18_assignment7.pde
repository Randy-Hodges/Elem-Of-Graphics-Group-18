// Bullies
int num_bullys = 4;
Bully[] bullys;
// Dodgeballs
Dodgeball[] allBalls;
int num_balls = 6;
//Player
Player p;
ArrayList<Ball> b;

void setup(){
  background(#83B4D8);
  size(1000, 1000);
  frameRate(20);
  createDodgeballs();
  createBullies();
  createPlayer();
  createBall();
}

void draw(){
  fill(#83B4D8);
  rect(0, 0, width, height);
  // noStroke();
  updateBullies();
  updateDodgeballs();
  p.addPlayer(); 
  p.keyPressed();
  throwBall();
}


void createBullies(){
  bullys = new Bully[num_bullys];
  for (int i = 0; i < num_bullys; i++){
    bullys[i] = new Bully(-width/8 + (width)*(i + 1)/num_bullys, height/4, 2, allBalls);
  }
}

void updateBullies(){
  for (int i = 0; i < num_bullys; i++){
    bullys[i].update();
  }
}

void createDodgeballs(){
  allBalls = new Dodgeball[num_balls];
  for (int i = 0; i < num_balls; i++){
    allBalls[i] = new Dodgeball(random(0, width), random(0, height));
  }
}

void updateDodgeballs(){
  for (int i = 0; i < num_balls; i++){
    allBalls[i].update();
  }
}

// add player
void createPlayer(){
  p = new Player(width/2, 750, 24);
}

// add balls player throws
void createBall(){
  b = new ArrayList<Ball>();
}
void keyPressed(){ 
    if (key == ' '){
      b.add( new Ball(p.playerX, p.playerY));
        
    }
}
    
void throwBall(){
  for (Ball aBall : b){
    aBall.addBall();
    aBall.move();
  }
}
