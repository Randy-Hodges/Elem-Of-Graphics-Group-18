class Player{
  
  int playerX, playerY; // player's position
  int playerSize = 24; // scaling player size
  
  Dodgeball[] allBalls;
  Dodgeball currentBall;
  
  boolean hasBall = false;
  String teamName;
  
  Player(int playerX, int playerY, int playerSize, String teamName){
    
    this.playerX = playerX;
    this.playerY = playerY;
    this.playerSize = playerSize;
    this.teamName = teamName;
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
  
  void pickUp(Dodgeball[] allBalls){
    this.allBalls = allBalls;
    for (Dodgeball ball: allBalls){
      if (ball.intersect(playerX, playerY) && (hasBall == false)){
        println("INTERSECT");
        ball.pickUp(true, playerX, playerY);
        currentBall = ball;
        println(playerX, playerY);
        hasBall = true;
      }
    }
    
  }
  
  boolean isPlayerHit(){
    for (Dodgeball ball: allBalls){
      if (ball.intersect(playerX, playerY) && !ball.isPlayerBall && !ball.dead){
        return true;
      }
    }
    return false;
  }

  // draws line from player to mouse position
  void aim(){
    strokeWeight(1);
    stroke(224, 225, 228);
    line(playerX, playerY, mouseX, mouseY);  
  }
  
  void launch(float x2, float y2){
    if (currentBall != null){
      PVector target = new PVector(x2, y2);
      PVector pos = new PVector(playerX, playerY);
      PVector dir = PVector.sub(target, pos);
      dir.normalize();
      dir.mult(.5);
      currentBall.launch(dir);
      hasBall = false;
      currentBall = null;
    }
    
  }
  
  // draws player to screen
  void addPlayer(){
    fill(#253237);
    ellipse(playerX, playerY, playerSize, playerSize);
     }
}
