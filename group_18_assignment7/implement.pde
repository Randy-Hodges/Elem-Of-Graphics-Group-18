Dodgeball ball0;
Dodgeball ball1;
Dodgeball ball2;
Player p1;
Dodgeball[] allBalls;
String team1Name = "hero";
String team2Name = "bullies";

void setup(){
  size(1000, 1000);
  ball0 = new Dodgeball(500, 500, 5, 15, 20, team1Name, team2Name);
  ball1 = new Dodgeball(500, 500, 5, 15, 20, team1Name, team2Name);
  ball2 = new Dodgeball(500, 500, 5, 15, 20, team1Name, team2Name);
  allBalls = new Dodgeball[3];
  allBalls[0] = ball0;
  allBalls[1] = ball1;
  allBalls[2] = ball2;
  p1 = new Player(width/2, 800, 40, team1Name);
}

void draw(){
  fill(255);
  rect(0, 0, width, height);
  line(0, 500, width, 500);
  ball1.applyFriction();
  ball1.applyBounce();
  ball1.showAllegiance();
  ball1.display();
  
  p1.pickUp(allBalls);
  p1.aim();
  p1.keyPressed();
  p1.addPlayer();
}

//void mousePressed(){
//  //if (mouseX < 500){
//  //  ball1.pickUp(mouseX, mouseY, team2Name);
//  //} else {
//  //  ball1.pickUp(mouseX, mouseY, team1Name);
//  //}
//  p1.launch(mouseX, mouseY);
//}

//void mouseReleased(){
//  ball1.launch(mouseX, mouseY, 10, 10);
//}

void mouseClicked(){
  p1.launch(mouseX, mouseY);
}
