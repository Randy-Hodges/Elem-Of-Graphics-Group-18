// Sharks
Shark shark1;
Shark shark2;
Shark[] sharkList;
// Minnows
Minnow[] minnows;
int num_minnows = 100;
//Plankton
Plankton p1;
Plankton p2;
//Bubbles
ArrayList<Bubble> bubbles = new ArrayList<Bubble>();


void setup(){
  background(#83B4D8);
  size(1000, 1000);
  createBubbles();
  createSharks();
  createMinnows();
  createPlankton();
}

void draw(){
  fill(#83B4D8);
  noStroke();
  rect(0, 0, width, height);
  
  //fill(#83B4D8, 10);
  //noStroke();
  //rect(0, 810, width, 190);
  // Update
  updateBubbles();
  fill(#83B4D8, 100);
  noStroke();
  rect(0, 0, width, height);
  
  updateSharks();
  updateMinnows();
  updatePlankton();
}

void createMinnows(){
    minnows = new Minnow[num_minnows];
    for (int i = 0; i < minnows.length; i++){
        minnows[i] = new Minnow(sharkList);
    }
}

void updateMinnows(){
    for (int i = 0; i < minnows.length; i++){
        minnows[i].update();
    }
}

void createSharks(){
  shark1 = new Shark(1, 1, "RIGHT", 0, 0, 600, height, 0, 200);
  shark2 = new Shark(1, 1, "LEFT", 400, 0, 600, height, 1, 100);
  sharkList = new Shark[2];
  sharkList[0] = shark1;
  sharkList[1] = shark2;
}

void updateSharks(){
  if (frameCount%8 == 0){
    shark1.swim();
    shark2.swim();
  }
  shark1.display();
  shark2.display();
}

void createPlankton(){
    p1 = new Plankton(70, 150, 30, 0, 800, width, 200);
    p2 = new Plankton(0, 100, 30, 0, 800, width, 200);

}

void updatePlankton(){
  if (frameCount%5 == 0){
      p1.move();
      p2.move();
  }
  
  p2.display();
  p1.display();

}

// functions for organization
void createBubbles() {
  
  for (int i = 0; i < 65; i = i+1) {
    bubbles.add(new Bubble(random(0, width), random(0, height)));
  }
  
}

void updateBubbles() {
  for (int i = 0; i < 64; i = i+1) {
    Bubble singleBubble = bubbles.get(i);
    Bubble otherBub = bubbles.get(i+1);
    singleBubble.bubblesTouch(otherBub);
  }
  for (int i = 0; i < 65; i = i+1) {
    Bubble singleBubble = bubbles.get(i);
    singleBubble.displayBubble();
    singleBubble.bubbleMoves();
  }
}
