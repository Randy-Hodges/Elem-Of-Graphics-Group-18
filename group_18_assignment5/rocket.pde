


class Rocket{
    PShape rocket;
    Monkey monkey;
    PVector pos;
    PVector last_pos; // determining speed
    float starting_x_frac, starting_y_frac, starting_z_frac;
    float width_range = .8*width;
    float min_x = (width - width_range)/2;
    float height_buffer = .6;
    float height_range = 200*height_buffer;
    float min_y = 300 + 200*(1-height_buffer)/2;
    Rocket(){
        rocket = loadShape("rocket_objects/Toy_Rocket.obj");
        monkey = new Monkey();
        pos = new PVector();
        last_pos = new PVector();
        starting_x_frac = random(-1, 1);
        starting_y_frac = random(-1, 1);
        starting_z_frac = random(-1, 1);
        pos.x = min_x + width_range/2 + width_range/2*starting_x_frac ;
        pos.y = min_y + height_range/2 + height_range/2*starting_y_frac ; 
    }

    void update(){
        last_pos = pos.copy();
        pos.x +=  width_range/2*sin(PI/2 + PI/2*starting_x_frac + frameCount/200.0)/200;
        pos.y +=  height_range/2*sin(PI/2 + PI/2*starting_y_frac + frameCount/50.0)/50;
        display();
        monkey.update(pos);
    }

    void display(){
        shapeMode(CENTER);
        pushMatrix();

        translate(pos.x, pos.y, 0);
        scale(30);     
        PVector xaxis = new PVector(1, 0, 0);
        PVector speed_vec = pos.copy().sub(last_pos).normalize(); // speed
        float angle = atan(speed_vec.y/speed_vec.x);
        if (speed_vec.x < 0){
            angle += PI;
        }
        pushMatrix();
        rotateZ(angle - PI/2);   
        shape(rocket, 0, 0, rocket.width, rocket.height);
        popMatrix();

        popMatrix();
        shapeMode(CORNER);
        scale(1);
    }

}


