
// Rockets
Rocket rocket1;
Rocket rocket2;
float angle;
PShape man;

// Spaceship
SpaceMan Ship1;

// Asteroid
Asteroid ast1;

// Planet
CenterSpaceBody earth;



void setup(){
    size(1000, 1000, P3D);
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0),
           width/2.0, height/2.0, 0,
           0, 1, 0);
    createPlanet();
    createRockets();
    createSpaceMan();
    createAsteroid();
    man = loadShape("objects/space_man/SpaceManModel.obj");
}

void draw(){
    background(30);
    addLights();
    updatePlanet();
    updateRockets();
    updateSpaceMan();
    updateAsteroid();
    // dummyCode();
}

void dummyCode(){
    angle += .01;
    pushMatrix();
    translate(width/2, height/2);
    rotateY(angle);
    scale(35);
    shape(man, 0, 0, man.width, man.height);
    popMatrix();
    scale(1);

}

void addLights(){
    lights();
}

void createPlanet() {
    earth = new CenterSpaceBody(int(width*0.63), -0.01, width*3, -height*2, -width*4);
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
    Ship1 = new SpaceMan(800, 900, 100, 150, 20); 
}

void updateSpaceMan(){
    Ship1.bob(40, TWO_PI);
    Ship1.drift(500);
    Ship1.roll();
    Ship1.display();
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
