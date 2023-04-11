class Player{
  
  PVector pos; // player's position
  int playerSize = 24; // scaling player size
  
  Dodgeball[] allBalls;
  Dodgeball currentBall;
  
  boolean hasBall = false;
  String teamName;
  
  Player(int posx, int posy, int playerSize, String teamName){
    pos = new PVector(posx, posy);
    this.playerSize = playerSize;
    this.teamName = teamName;
  }
  
  // movement of player
  void keyPressed(){
    
    if (key == 'w'|| key == 'W'){
     pos.y = pos.y - 5;
     if (pos.y < 500){
      pos.y = 500;
     }
    }
    if (key == 's' || key == 'S'){
      pos.y = pos.y + 5;
      if (pos.y > height){
        pos.y = height;
      }
    }
    if (key == 'd' || key == 'D'){
     pos.x = pos.x + 5;
     if (pos.x > width){
       pos.x = width;
     }
     }
    
    if (key == 'a' || key == 'A'){
     pos.x = pos.x - 5;
     if (pos.x < 0){
       pos.x = 0;
     }
    }
  }
  
  void pickUp(Dodgeball[] allBalls){
    this.allBalls = allBalls;
    for (Dodgeball ball: allBalls){
      if (ball.intersect(pos.x, pos.y) && (hasBall == false)){
        println("INTERSECT");
        ball.pickUp(true, pos.x, pos.y);
        currentBall = ball;
        println(pos.x, pos.y);
        hasBall = true;
      }
    }
    
  }
  
  boolean isPlayerHit(){
    for (Dodgeball ball: allBalls){
      if (ball.intersect(pos.x, pos.y) && !ball.isPlayerBall && !ball.dead){
        return true;
      }
    }
    return false;
  }

  // draws line from player to mouse position
  void aim(){
    strokeWeight(1);
    stroke(224, 225, 228);
    line(pos.x, pos.y, mouseX, mouseY);  
  }
  
  void launch(float x2, float y2){
    if (currentBall != null){
      PVector target = new PVector(x2, y2);
      PVector ball_pos = new PVector(pos.x, pos.y);
      PVector dir = PVector.sub(target, ball_pos);
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
    ellipse(pos.x, pos.y, playerSize, playerSize);
     }
}
