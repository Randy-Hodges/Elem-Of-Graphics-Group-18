
// Rockets
Rocket rocket1;
Rocket rocket2;

// Spaceship
SpaceMan Ship1;

// Asteroid
Asteroid ast1;

// Your stuff Here


void setup(){
    size(1000, 1000, P3D);
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0),
           width/2.0, height/2.0, 0,
           0, 1, 0);
    createRockets();
    createSpaceMan();
    createAsteroid();
}

void draw(){
    background(30);
    updateRockets();
    updateSpaceMan();
    updateAsteroid();
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
    
void createAsteroid(){
  ast1 = new Asteroid(0, 450);
}

void updateAsteroid(){
  pushMatrix();
  ast1.displayAsteroid(30);
   popMatrix();
 
}
    
}
