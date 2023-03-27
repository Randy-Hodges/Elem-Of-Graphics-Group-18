


class Minnow{
    float SHARK_FORCE_CONST = 100.0; 
    float MAX_BOUND_FORCE = 500;
    color circe_color;
    PImage fish;
    // Sharks
    Shark[] sharks;
    float shark_width = 250, shark_height = 150;    
    // Physics
    float m = 100.0, gravity = 1.62;
    PVector pos, vel, acc, f;
    PVector last_pos; // determining speed
    PVector center;

    Minnow(Shark[] sharks){
        this.sharks = sharks;
        fish = loadImage("pictures/minnows/fish.png");
        pos = new PVector();
        vel = new PVector();
        acc = new PVector();
        f = new PVector();
        pos.x = 2*width/4;
        pos.y = 4*height/6;
        vel.x = 5;
        center = new PVector(width/2, height/2);
    }

    void update(){
        last_pos = pos.copy();
        gatherForces();
        applyForces();
        display();
    }

    void gatherForces(){
        f.set(0, 0);
        f.add(getGravityForce());
        // f.add(getSharkForce(0));
        // f.add(getSharkForce(1));
        f.add(getBoundaryForce());
    }

    PVector getSharkForce(int i){
        float k = 3;
        // Gets a vector representing how close a fish is to a shark
        PVector closeness = sharks[i].getSharkPosition().sub(pos);
        // Account for the width and height of the shark
        closeness = closeness.set(constrain(abs(closeness.x) - shark_width, 1, 1000), constrain(abs(closeness.y) - shark_height, 1, 1000));
        // Get force using sigmoid function
        PVector shark_force = new PVector(SHARK_FORCE_CONST*sigmoid(k, 10/closeness.x, .5), SHARK_FORCE_CONST*sigmoid(k, 10/closeness.y, .5));
        println(shark_force);
        return shark_force;
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
        bound_force.add(new PVector(0, -MAX_BOUND_FORCE*sigmoid(k, pos.y, height)));
        // // lower bound
        bound_force.add(new PVector(0, MAX_BOUND_FORCE*sigmoid(k, -pos.y, 0)));
        // println(bound_force);
        return bound_force;
    }

    float sigmoid(float k, float x, float xnot){
        return 1 / (1 + exp(-k*(x-xnot)));
    }

    void applyForces() {
        acc.x = f.x/m;
        acc.y = f.y/m;
        vel.x += acc.x;
        vel.y += acc.y;
        pos.x += vel.x;
        pos.y += vel.y;
    }

    void display(){
        pushMatrix();
        imageMode(CENTER);
        translate(pos.x, pos.y);
        scale(.5);     

        pushMatrix();
        rotate(vel.copy().heading() + PI/2);   
        image(fish, 0, 0);
        fill(0);
        ellipse(0, 0, 10, 10);
        popMatrix();

        popMatrix();
        scale(1);
        imageMode(CORNER);
    }

}


