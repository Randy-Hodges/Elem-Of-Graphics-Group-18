Shark shark1;
Shark shark2;
Shark[] sharkList;

void setup(){
  size(1000, 1000);
  createSharks();
}

void draw(){
  fill( #83B4D8);
  noStroke();
  rect(0, 0, width, height);
  updateSharks();
}

void createSharks(){
  shark1 = new Shark(1, 1, "RIGHT", 0, 0, 600, height, 0, 150);
  shark2 = new Shark(1, 1, "LEFT", 400, 0, 600, height, 1, 50);
  sharkList = new Shark[2];
  sharkList[0] = shark1;
  sharkList[1] = shark2;
}

void updateSharks(){
  if (frameCount%10 == 0){
    shark1.swim();
    shark2.swim();
  }
  shark1.display();
  shark2.display();
}

