class Player{
  
  int playerX, playerY; // player's position
  int playerSize = 24; // scaling player size
  
  Player(int playerX, int playerY, int playerSize){
    this.playerX = playerX;
    this.playerY = playerY;
    this.playerSize = playerSize;
  }
  
// movement of player
  void keyPressed(){
    
    if (key == 'w'|| key == 'W'){
     playerY = playerY - 5;
     if (playerY < 500){
      playerY = 500;
     }
    }
    if (key == 's' || key == 'S'){
      playerY = playerY + 5;
      if (playerY > height){
        playerY = height;
      }
    }
    if (key == 'd' || key == 'D'){
     playerX = playerX + 5;
     if (playerX > width){
       playerX = width;
     }
     }
    
    if (key == 'a' || key == 'A'){
     playerX = playerX - 5;
     if (playerX < 0){
       playerX = 0;
     }
    }
  }

  // draws line from player to mouse position
  void aim(){
    strokeWeight(1);
    stroke(224, 225, 228);
    line(playerX, playerY, mouseX, mouseY);
  }
  // draws player to screen
  void addPlayer(){
    background(#9DB4C0);
    fill(#253237);
    ellipse(p.playerX, p.playerY, p.playerSize, p.playerSize);
     }
}
