


class Monkey{
    PShape monkey;
    float radius = 80;
    float angle;
    color gold = #d3a41e ;
    color brown = #593e31 ;
    color orange = #c3602c ;
    color gray = #3c3c3c;
    color[] colors = {gold, brown, orange, gray};

    Monkey(){
        monkey = loadShape("rocket_objects/monkey.obj");
        monkey.setFill(colors[(int)random(colors.length)]);
        angle = random(0, TWO_PI);
    }

    void update(PVector pos){
        angle -= .01;
        display(pos);
    }

    void display(PVector pos){
        shapeMode(CENTER);
        pushMatrix();

        translate(pos.x, pos.y, pos.z);
        pushMatrix();
        rotateY(angle);   
        translate(radius, 0, 0);
        rotateZ(PI);   
        scale(20);     
        shape(monkey, 0, 0, monkey.width, monkey.height);
        popMatrix();

        popMatrix();
        shapeMode(CORNER);
        scale(1);
    }
}

