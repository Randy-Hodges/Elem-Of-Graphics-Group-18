
class Score {
  int points;
  PFont monospacedBig;
  PFont monospacedSmall;
  
  Score() {
    monospacedBig = createFont("Monospaced", 32);
    monospacedSmall = createFont("Monospaced", 14);
  }
  
  void displayingScore() {
    // text box 
    fill(0);
    rect(0, height*0.15, width*0.1, height*0.1);
    
    // Score and points beneath
    fill(255);
    textFont(monospacedBig);
    text("Score", 0, height*0.2);
    textFont(monospacedSmall);
    text(points, width*0.01, height*0.23);
  }
  
  void resetScore() {
    points = 0;
  }
  
  // add points when 
  void addPoints() {
    if (points >= 999999000) {
      points += 1000;
    }
  }
  
}
