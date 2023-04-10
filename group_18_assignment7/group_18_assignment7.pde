// Bullies
int num_bullys = 4;
Bully[] bullys;

void setup(){
  background(#83B4D8);
  size(1000, 1000);
  frameRate(20);
  createBullies();
}

void draw(){
  fill(#83B4D8);
  rect(0, 0, width, height);
  // noStroke();
  updateBullies();
 
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