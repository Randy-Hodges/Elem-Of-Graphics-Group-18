// Bullies
int num_bullys = 4;
Bully[] bullys;
int num_bullies_defeated = 0;
// Dodgeballs
Dodgeball[] allBalls;
int num_balls = 6;
// Player
Player hero;

void setup(){
  background(#83B4D8);
  size(1000, 1000);
  frameRate(20);
  createDodgeballs();
  createBullies();
  createPlayer();
}

void draw(){
  fill(#83B4D8);
  rect(0, 0, width, height);
  // noStroke();
  updateBullies();
  updateDodgeballs();
  hero.keyPressed();
  updatePlayer();
}

void createPlayer(){
  hero = new Player(width/2, 800, 30, "hero");
}

void updatePlayer(){
  hero.pickUp(allBalls);
  hero.addPlayer(); 
  if (hero.isPlayerHit()){
    rect(0, 0, width, height);
  }
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
    allBalls[i].move();
    allBalls[i].overrideMove(hero.pos.x, hero.pos.y);
    allBalls[i].applyBounce();
    allBalls[i].updateAllegiance();
    allBalls[i].display();
  }
}

void mouseClicked(){
  hero.launch(mouseX, mouseY);
}
