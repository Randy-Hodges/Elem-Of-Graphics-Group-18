// color constants
color space = #262262;
color yellow = #D9EA39;
color pink = #EE6AFF;

// separate lists of word counts and frequencies
String[] words = {};
String[] frequencies = {};

// common units of translation
int trans_x = 125;
int trans_y = 100;

// to adjust max values to the size of the canvas
float adjust_h;
float adjust_w;

// keeps track of the index for keyButton functino
int key_index = 0;

// Font constants
PFont smallFont; // Caption Font
PFont bigFont; //  Statement Font


void setup(){
  size(1000, 1000);
  background(space);
  
  // initializes fonts
  bigFont = createFont("Colt-Light", 80);
  smallFont = createFont("RocGrotesk-CondensedLight", 30);
  
  // reads in the word/frequency data
  String[] data = loadStrings("wordfrequency.txt");
  read(data);
  
  // places the graph
  translate(trans_x, trans_y);
  graph(height/1.6, width/1.5);
}


void draw(){ 
  
  // updates words & num uses
  String word_text = words[key_index];
  String freq_text = frequencies[key_index];
  
  // refreshes backgrund
  fill(space);
  rect(0, height/1.26, width, 400);
  
  // displays updated word/freq info
  // correlates with selected graph point
  fill(pink);
  textFont(bigFont);
  text(word_text, width/1.68, height/1.16);
  fill(yellow);
  
  // yellow line at bottom of canvas
  stroke(yellow);
  strokeWeight(2);
  line(width/9.2, height/1.14, width, height/1.14);
  noStroke();
  
  // footer labels
  // instructions for interaction (< or >)
  text(freq_text, width/1.68, height/1.05);
  textFont(smallFont);
  fill(pink);
  text("WORDS", width/1.118, height/1.16);
  fill(yellow);
  text("USES", width/1.093, height/1.095);
  fill(yellow);
  text("USE LEFT & RIGHT ARROWS", width/9.5, height/1.095);

}


void read(String[] data){
  // separate word frequency from number of words
  // creates a word array and a frequency array
  // assumes word count in text file is in ascending order
  for (int i=0; i < data.length; i++){
    String temp = data[i];
    String[] separate = split(temp, ": ");
    words = append(words, separate[0]);
    frequencies = append(frequencies, separate[1]);
  }
}


void graph(float h, float w){
  // sets maximum constants
  // sets adjustment values to scale max constants to the canvas
  float max_h = float(words[words.length-1]);
  float max_w = float(frequencies[0]);
  adjust_h = max_h/h;
  adjust_w = max_w/w;
  
  // defines opacity increments
  float op_adjust = 255/float(words.length);
  float opacity = op_adjust;

  // creates bars that represent the data
  // x is the frequency
  // y is the number of words with that frequency
  for (int i = words.length - 1; i > -1; i--){
    float x = float(frequencies[i]) / adjust_w;
    float y = float(words[i]) / adjust_h;
    noStroke();
    rectMode(CORNER);
    fill(space);
    rect(0, 0, x-1, y-1, 50);
    fill(pink, opacity);
    rect(0, 0, x, y, 50);
    opacity += op_adjust; // adjusts opacity
    println(opacity);
    
    fill(pink);
    ellipseMode(CENTER);
    ellipse(x, y, 10, 10);
    ellipseMode(CORNER);
  }
  
  // creates the x and y axis
  stroke(yellow);
  line(0, -20, max_w/adjust_w, -20);
  stroke(pink);
  line(-20, 0, -20, max_h/adjust_h);
  noStroke();
  
  //formats the graph axis
  fill(yellow);
  textFont(smallFont);
  text("0", -23, -13);
  text("NUM USES", (max_w/adjust_w) + 20, -13);
  fill(pink);
  text("WORDS", -23, (max_h/adjust_h)+40);
}

void keyPressed(){
  // navigates between the different
  // plot points on the graph
  int max = words.length -1;
  int prev = key_index;
  if (keyCode == RIGHT && (key_index == 0)){
    key_index = 0;
  } else if (keyCode == LEFT && (key_index == max)){
    key_index = max;
  } else if (keyCode == LEFT && ((key_index == 0) || (key_index > 0))){
    key_index += 1;
  } else if (keyCode == RIGHT && ((key_index == max) || (key_index < max))){
    key_index -= 1;
  }
  
  // creates interactive yellow point selections
  float word = (float(words[key_index])/adjust_h);
  float p_word = (float(words[prev])/adjust_h);
  float freq = (float(frequencies[key_index])/adjust_w);
  float p_freq = (float(frequencies[prev])/adjust_w);
  ellipseMode(CENTER);
  noStroke();
  fill(space);
  ellipse(p_freq + trans_x, p_word + trans_y, 20, 20);
  fill(pink);
  ellipse(p_freq + trans_x, p_word + trans_y, 10, 10);
  fill(yellow);
  ellipse(freq + trans_x, word + trans_y, 15, 15);
  ellipseMode(CORNER);

}
