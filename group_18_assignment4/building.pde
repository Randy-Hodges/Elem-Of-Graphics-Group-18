class Building {
    float bwidth, bheight, xvel;
    PVector pos;
    color bcolor;
    color red = #b76256;
    color beige = #c6b599;
    color blue = #567a83;
    color[] colors = {red, beige, blue};
    boolean on_screen = false;
    Window[] windows; 
    int max_num_spinners;

    Building(){
        float[] heights = {300, 400, 500};
        float[] widths = {200, 250, 300};
        bwidth = widths[(int)random(widths.length)];
        bheight = heights[(int)random(heights.length)];
        xvel = -2;  
        bcolor = colors[(int)random(colors.length)];
        pos = new PVector(1000, 800 - bheight);
        max_num_spinners = (int) random(1, 4);
        createWindows();
    }

    void update(){
        pos.x += xvel;
        checkOnScreen();
        display();
    }

    void display(){
        // Outer frame
        fill(30);
        rect(pos.x, pos.y, bwidth, bheight);
        // Inner body
        int border = 10;
        fill(bcolor);
        rect(pos.x + border/2, pos.y + border/2, bwidth - border, bheight - border);
        updateWindows();
    }

    void checkOnScreen(){
        // Right side then left side check (with buffer)
        if (pos.x + bwidth < width && pos.x + bwidth > -bwidth){
            on_screen = true;
        }
        else{
            on_screen = false;
        }
    }

    void createWindows(){
        // Fills out the windows[] array with new instances of Windows
        int[] windowSizes = {4, 9, 16};
        int num_windows = windowSizes[(int)random(windowSizes.length)];
        windows = new Window[num_windows];
        int width = (int) sqrt(num_windows);
        float bufferx = bwidth / num_windows;
        float buffery = bheight / num_windows;
        float xspacing = (bwidth - 2*bufferx)/width;
        float yspacing = (bheight - 2*buffery)/width;
        for (int i = 0; i < num_windows; i++){
            float x = bufferx + bwidth/20 + (i%width)*xspacing;
            float y = buffery + (int)(i/width)*yspacing;
            windows[i] = (new Window(x, y, bwidth, bheight, pos, xvel, num_windows, this));
        }
        assignSpinners();
    }

    void assignSpinners(){
        for (int i = 0; i < max_num_spinners; i++){
            assignNewSpinner();
        }
    }

    void assignNewSpinner(){
        int index = (int) random(windows.length);
        // Only add a spinner to a window that isn't already spinning
        if (!windows[index].spinner){
            windows[index].spinner = true;
        }
        else{
            assignNewSpinner();
        }
    }

    void updateWindows(){
        for (int i = 0; i < windows.length; i++){
            Window curWindow = windows[i];
            curWindow.update();
        }
    }
}