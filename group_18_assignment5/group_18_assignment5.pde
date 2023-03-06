PImage bg;
// Rockets
Rocket rocket1;
Rocket rocket2;

// Spaceship
SpaceMan ship1;

// Asteroid
Asteroid ast1;

// Planet
CenterSpaceBody earth;


void setup(){
    size(1001, 1001, P3D);
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0),
           width/2.0, height/2.0, 0,
           0, 1, 0);
    bg = loadImage("objects/SpaceBackground.jpeg");
    createPlanet();
    createRockets();
    createSpaceMan();
    createAsteroid();
}

void draw(){
    background(bg);
    addLights();
    updatePlanet();
    updateRockets();
    updateSpaceMan();
    updateAsteroid();
}

void addLights(){
    lights();
}

void createPlanet() {
    earth = new CenterSpaceBody(int(width*0.7), -0.01, width/2, -height, -width*4);
}

void createRockets(){
    rocket1 = new Rocket();
    rocket2 = new Rocket();
}

void updateRockets(){
    rocket1.update();
    rocket2.update();
}

void createSpaceMan(){
    ship1 = new SpaceMan(800, 900, 100, 150, 20); 
}

void updateSpaceMan(){
    ship1.bob(40, TWO_PI);
    ship1.drift(500);
    ship1.roll();
    ship1.display();
}
    
void createAsteroid(){
  ast1 = new Asteroid(0, 600);
}

void updateAsteroid(){
if (ast1.xpos > 1100 ){
    ast1.xpos = -50;
  }
  pushMatrix();
  ast1.displayAsteroid(30);
   popMatrix();
 
}

void updatePlanet() {
    earth.display();
}
