
class Field {
  // colors for themes
  color colOne;
  color colTwo;
  color colThree;
  color colFour;
  
  Field() {
    colOne = color(30);
    colTwo = color(60);
    colThree = color(90);
    colFour = color(120);
  }
  
  void displayingField() {
    // making of the court
    stroke(255);
  
    fill(colOne);
    rect(0, 0, width, height);
  
    fill(colTwo);
    circle(width/2, height/2, width*.12);
  
    fill(colThree);
    stroke(90);
    circle(width/2, (height*0.0525), width*0.44);
    circle(width/2, height * 0.9475, width*0.44);
    rect(width/2 - width*0.22, 0, width*0.44, height*0.0525);
    rect(width/2 - width*0.22, height * 0.9475, width*0.44, height*0.0525);
  
  
    fill(colFour);
    stroke(255);
    circle(width/2, height*0.20625, width*.12);
    circle(width/2, height*0.79370, width*.12);
    rect(width/2 - width*0.06, 0, width*.12, height*0.20625);
    rect(width/2 - width*0.06, height*0.79370, width*.12, height*0.79370);
  
    line(0, height/2, width, height/2);
    line(width - 1, 0, width - 1, height);
  }
  
  /* change color/difficulty is same thing
     court color intensity                */
  void changeColor(float difficulty) {
    // easy
    if (difficulty == 1) {
      colOne = color(47, 79, 79);
      colTwo = color(0, 128, 128);
      colThree = color(32, 178, 170);
      colFour = color(144,238,144);
    } // medium
    else if (difficulty == 2) {
      colOne = color(47, 20, 79);
      colTwo = color(0, 20, 128);
      colThree = color(32, 20, 170);
      colFour = color(144,20,144);
    } // hard
    else if (difficulty == 3) {
      colOne = color(47, 0, 0);
      colTwo = color(128, 0, 20);
      colThree = color(178, 32, 32);
      colFour = color(238,144,144);
    } // catches anything else
    else {
      colOne = color(30);
      colTwo = color(60);
      colThree = color(90);
      colFour = color(120);
    }
    
  }
  
  
}
