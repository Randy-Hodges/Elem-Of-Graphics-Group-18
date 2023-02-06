/* 
a3_novelvisualization

Assignment Description:
This Processing file will generate a word cloud based on the contents of uniquewords.txt. This word cloud will a 700x600 canvas and contain as many of the unique words 
that can fit legibly within this space.

Your group will pick a font, a font size and a set of 3 colors to customize the word cloud. Upon running this file, Processing will display a random selection of unique 
words (using Processing's random() function). These words will have a consistent spacing between them and will not run over the edge of the canvas in terms of either width or height.

You will explain your choices of font, font size and font colors (why are certain words certain colors?) in the documentation. Upon clicking the canvas, a new selection of 
random, unique words will replace the previous. 
*/

PFont font;
int font_size = 50;
int spacing = 15;
String[] words;

void setup(){
    size(700, 600);
    background(80);
    // Adding Font
    font = createFont("BeautyMountainsPersonalUse-od7z.ttf", font_size);
    textFont(font, font_size);
    // Loading Words
    words = loadStrings("uniquewords.txt");
    ArrayList<String> available_words = new ArrayList<String>();
    for (int i = 0; i < words.length; i++){
        available_words.add(words[i]); // Converting to arraylist because it is convenient
    }
    int max_lines = (int) (height/(font_size + spacing));
    int line_count = 0;
    int cur_width = spacing;
    // Adding randomized text to screen
    while (true){
        if (available_words.size() == 0){
            break;
        }
        // Selecting Word
        int index = (int) random(available_words.size());
        String word = available_words.get(index);
        available_words.remove(index);
        // Placing word
        float word_width = textWidth(word);
        float future_text_width = cur_width + word_width + spacing;
        if (future_text_width > width){
            cur_width = spacing;
            line_count += 1;
            if (line_count >= max_lines){
                break;
            }
        }
        selectTextColor(word);
        float buffer_from_top = spacing*3;
        text(word, cur_width, buffer_from_top + (spacing + font_size)*line_count);
        cur_width += word_width + spacing;
    }

}

void draw(){

}

void selectTextColor(String word){
    int small_thresh = 6;
    int med_thresh = 8;
    color pink = color(250, 13, 235);
    color yellow = color(245, 250, 13);
    color teal = color(13, 232, 250);
    // Selecting color
    int word_length = word.length();
    if (word_length <= small_thresh){
        fill(teal);
    }
    else if (word_length <= med_thresh){
        fill(pink);
    }
    else{
        fill(yellow);
    }
}