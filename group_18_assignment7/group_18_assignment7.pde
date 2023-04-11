// Bullies
int num_bullys = 4;
Bully[] bullys;
int num_bullies_defeated = 0;
// Dodgeballs
Dodgeball[] allBalls;
int num_balls = 6;
// Player
Player hero;
Score score;
Field field;
PImage lose;
PImage win;
PImage menu;
boolean gameStart = false;

void setup(){
  background(#83B4D8);
  size(1000, 1000);
  frameRate(20);
  createGUI();
  createDodgeballs();
  createBullies();
  createPlayer();
}

void draw(){
  fill(#83B4D8);
  rect(0, 0, width, height);
  // noStroke();
  updateGUI();
  updateBullies();
  updateDodgeballs();
  hero.keyPressed();
  updatePlayer();
  startGame();
  endGame();
}

void startGame(){
  if (gameStart == true){
    image(menu, -width, 0);
    loop();
  } else {
    image(menu, 0, 0);
  }
}

void endGame(){
  if (hero.isPlayerHit()){
    image(lose, 0, 0);
    noLoop();
  } else if (num_bullies_defeated == num_bullys){
    image(win, 0, 0);
    noLoop();
  }

}

void createGUI(){
  score = new Score();
  field = new Field();
  lose = loadImage("Game Loading Images/Game End Lose.png");
  win = loadImage("Game Loading Images/Game End Win.png");
  menu = loadImage("Game Loading Images/Game Menu.png");
  
}

void updateGUI(){
  field.displayingField();
  score.displayingScore();
  score.points = num_bullies_defeated;
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
  if (gameStart == false){
    gameStart = !gameStart;
  }
}
