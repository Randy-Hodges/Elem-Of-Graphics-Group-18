class Window {
    float wwidth, wheight, xvel;
    PVector pos;
    color wcolor;
    color yellow = #f1d700;
    color black = #515151;
    color[] colors = {black, yellow};
    boolean spinner = false;
    float cur_angle = 0;
    float d_angle = PI/100;
    Building build; 
    Window(float x, float y, float bwidth, float bheight, PVector bpos, float xvel, int num_windows, Building build){
        wwidth = bwidth/10;
        wheight = bheight/10;
        wcolor = colors[(int)random(colors.length)];
        this.xvel = xvel;
        pos = new PVector(bpos.x + x, bpos.y + y);
        this.build = build;
    }

    void update(){
        pos.x += xvel;
        if (spinner){
            spin();
            return;
        }
        display();
    }

    void display(){
        // Frame
        float border = 6.0;
        fill(200);
        rect(pos.x, pos.y, wwidth, wheight);
        // Body
        fill(wcolor);
        rect(pos.x + border/2, pos.y + border/2, wwidth - border, wheight - border);
    }

    void display(float x, float y){
        rectMode(CENTER);
        // Frame
        float border = 6.0;
        fill(200);
        rect(x, y, wwidth, wheight);
        // Body
        fill(wcolor);
        rect(x, y, wwidth - border, wheight - border);
        rectMode(CORNER);
    }

    void spin(){
        // Spins a window if set as a spinner
        pushMatrix();
        translate(pos.x + wwidth/2, pos.y + wheight/2);
        cur_angle += d_angle;
        rotate(cur_angle);
        display(0, 0);
        popMatrix();
        if (cur_angle >= PI){
            cur_angle = 0;
            spinner = false;
            build.assignNewSpinner();
        }
    }
}