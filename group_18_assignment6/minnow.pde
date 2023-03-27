


class Minnow{
    float SHARK_FORCE_CONST = 50.0; 
    float MAX_BOUND_FORCE = 500;
    float MAX_SPEED = 5, MAX_INIT_POS = .4*width;
    float LOWER_BUFFER = 200; // Determines dist from floor that is boundary for fish
    color fish_color;
    PImage fish;
    // Sharks
    Shark[] sharks;
    float shark_width = 250, shark_height = 150;
    float dist_to_shark;    
    // Physics
    float m = 100.0, gravity = 2.62;
    PVector pos, vel, acc, f;
    PVector center; // used for gravity

    Minnow(Shark[] sharks){
        this.sharks = sharks;
        fish = loadImage("pictures/minnows/fish_white.png");
        pos = new PVector();
        vel = new PVector();
        acc = new PVector();
        f = new PVector();
        center = new PVector(width/2, height/2);
        randomizeInitialPhysics();
    }

    void update(){
        gatherForces();
        applyForces();
        clampSpeed();
        updateColor();
        display();
    }

    void randomizeInitialPhysics(){
        pos = center.copy().add(PVector.random2D().mult(MAX_INIT_POS));
        pos.y = pos.y - LOWER_BUFFER/2;
        vel = PVector.random2D().mult(MAX_SPEED);
    }

    void clampSpeed(){
        vel.limit(MAX_SPEED);
    }

    float sigmoid(float k, float x, float xnot){
        return 1 / (1 + exp(-k*(x-xnot)));
    }

    void gatherForces(){
        dist_to_shark = 1000;
        f.set(0, 0);
        f.add(getGravityForce());
        f.add(getSharkForce(0));
        f.add(getSharkForce(1));
        f.add(getBoundaryForce());
    }

    PVector getSharkForce(int i){
        // Fish swim away from sharks when they are close
        float k = 10;
        // Gets a vector representing how close a fish is to a shark
        PVector closeness = sharks[i].getSharkPosition().sub(pos);
        PVector direction = closeness.copy().normalize().mult(-1);
        dist_to_shark = min(closeness.mag(), dist_to_shark);
        // Account for the width and height of the shark
        closeness = closeness.set(constrain(abs(closeness.x) - shark_width, 1, width), constrain(abs(closeness.y) - shark_height, 1, height));
        // Get force using sigmoid function
        float shark_force = SHARK_FORCE_CONST*sigmoid(k, 10/closeness.mag(), 1);
        return new PVector(shark_force*direction.x, shark_force*direction.y);
    }

    PVector getGravityForce(){
        // Get gravity force (This force is directed towards center of screen)
        return center.copy().sub(pos).normalize().mult(gravity);
    }

    PVector getBoundaryForce(){ 
        float k = .1;
        PVector bound_force = new PVector();
        // right bound
        bound_force.add(new PVector(-MAX_BOUND_FORCE*sigmoid(k, pos.x, width), 0));
        // left bound
        bound_force.add(new PVector(MAX_BOUND_FORCE*sigmoid(k, -pos.x, 0), 0));
        // upper bound
        bound_force.add(new PVector(0, -MAX_BOUND_FORCE*sigmoid(k, pos.y, height - LOWER_BUFFER)));
        // // lower bound
        bound_force.add(new PVector(0, MAX_BOUND_FORCE*sigmoid(k, -pos.y, 0)));
        // println(bound_force);
        return bound_force;
    }

    void applyForces() {
        acc.x = f.x/m;
        acc.y = f.y/m;
        vel.x += acc.x;
        vel.y += acc.y;
        pos.x += vel.x;
        pos.y += vel.y;
    }

    void updateColor(){
        float blue = 220;
        float red = 220;
        float green = 20;
        blue = constrain(50000/dist_to_shark, 0, 255);
        red = constrain(50000/dist_to_shark, 0, 255);
        fish_color = color(red, green, blue);
    }

    void display(){
        pushMatrix();
        imageMode(CENTER);
        translate(pos.x, pos.y);
        scale(.2);     

        pushMatrix();
        rotate(vel.copy().heading() + PI/2); 
        tint(fish_color);  
        image(fish, 0, 0);
        fill(0);
        ellipse(0, 0, 10, 10);
        popMatrix();

        popMatrix();
        scale(1);
        imageMode(CORNER);
    }

}


