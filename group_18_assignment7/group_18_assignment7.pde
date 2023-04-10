// Bullies
int num_bullys = 4;
Bully[] bullys;
// Dodgeballs
Dodgeball[] allBalls;
int num_balls = 6;

void setup(){
  background(#83B4D8);
  size(1000, 1000);
  frameRate(20);
  createBullies();
  createDodgeballs();
}

void draw(){
  fill(#83B4D8);
  rect(0, 0, width, height);
  // noStroke();
  updateBullies();
  updateDodgeballs();
}


void createBullies(){
  bullys = new Bully[num_bullys];
  for (int i = 0; i < num_bullys; i++){
    bullys[i] = new Bully(-width/8 + (width)*(i + 1)/num_bullys, height/4, 2);
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