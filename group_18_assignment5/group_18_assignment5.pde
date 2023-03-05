
// Rockets
Rocket rocket1;
Rocket rocket2;
// Your stuff Here


void setup(){
    size(1000, 1000, P3D);
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0),
           width/2.0, height/2.0, 0,
           0, 1, 0);
    createRockets();
}

void draw(){
    background(30);
    updateRockets();
}

void createRockets(){
    rocket1 = new Rocket();
    rocket2 = new Rocket();
}

void updateRockets(){
    rocket1.update();
    rocket2.update();
}