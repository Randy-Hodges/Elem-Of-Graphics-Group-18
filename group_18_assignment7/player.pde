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
        ball.pickUp(playerX, playerY, teamName);
        currentBall = ball;
        println(playerX, playerY);
        hasBall = true;
      }
    }
    
  }

  // draws line from player to mouse position
  void aim(){
    strokeWeight(1);
    stroke(224, 225, 228);
    line(playerX, playerY, mouseX, mouseY);  
  }
  
  void launch(float x2, float y2){
    if (currentBall != null){
      float run = x2 - playerX;
      float rise = y2 - playerY;
      PVector slope = new PVector(playerX - x2, playerY - y2);
      PVector target = new PVector(x2, y2);
      slope.normalize();
      //vel = new PVector(0, 10);
      //vel.rotate(degrees(a));
      currentBall.launch(playerX, playerY, slope.x*10, slope.y*10);
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
