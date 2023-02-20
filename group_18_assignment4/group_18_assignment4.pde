/*

*/
// import processing.sound.*; // make sure you first download the Processing Sound library

// Buildings
ArrayList<Building> buildings = new ArrayList<Building>();

// Cars
// SoundFile carHorn; // "Small car horn" from mixkit.co
Car car1;
Car car2;
Car car3;
Car car4;

// Suns
Sun sun;
Rays rays;

void setup(){
    size(1000, 1000);
    smooth();
    createSuns();
    createBuildings();
    createCars();

}

void draw(){
    background(215, 234, 249);
    updateSuns();
    updateBuildings();
    road();
    updateCars();

}

void createBuildings(){
    buildings.add(new Building());
}

void createCars(){
    car1 = new Car(100, 800, 300, #F55E5E);
    car2 = new Car(400, 800, 300, #7AC9D8);
    car3 = new Car(800, 800, 300, #5F6464);
    car4 = new Car(200, 900, 400, #f1d700);
    // carHorn = new SoundFile(this, "audio/mixkit-small-car-horn-717.wav");
}

void createSuns(){
    sun = new Sun(-100, 500, 100, 1);
    sun.startX = -100;
    sun.startY = 500;
    sun.radius = 100;
    
    rays = new Rays (-100, 500, 1, 10, -100);
    rays.startX = 0;
    rays.startY = 80;
    rays.angle = 0;
    rays.rect_width = 10;
    rays.translateX = -100;
}

void updateBuildings(){
    for(int i = 0; i < buildings.size(); i++){
        Building cur_building = buildings.get(i);
        cur_building.update();
        // If building is past the left edge of the screen, remove it.
        if (!cur_building.on_screen && i != buildings.size() - 1){
            buildings.remove(i);
        }
        // If newBuild is fully on the screen, add a new building
        if (cur_building.on_screen && i == buildings.size() - 1){
            buildings.add(new Building());
        }
    }
}

void updateCars(){
  color bcolor;
  color br_red = #F55E5E;
  color br_blue = #7AC9D8;
  color black = #5F6464;
  //color yellow = #f1d700;
  color[] colors = {br_red, br_blue, black};
  
  if (car1.x == width){
    bcolor = colors[(int)random(colors.length)];
    car1.changeColor(bcolor);
  }
  
  if (car2.x == width){
    bcolor = colors[(int)random(colors.length)];
    car2.changeColor(bcolor);
  }
  if (car3.x == width){
    bcolor = colors[(int)random(colors.length)];
    car3.changeColor(bcolor);
  }
  
  if (car4.x == width){
    bcolor = colors[(int)random(colors.length)];
    car4.changeColor(bcolor);
  }
  
  car1.display();
  car2.display();
  car3.display();
  car4.display();
  car1.drive(3, 1);
  car2.drive(3, 1);
  car3.drive(3, 1);
  car4.drive(0, 1);
}

void updateSuns(){
    pushMatrix();
    translate(width/2, height/2);
    fill(0);
    ellipse(0, 0, 1, 1);
    background(215, 234, 249);
    pushMatrix();
    sun.display();
    rays.display();
    popMatrix();
    popMatrix();
}

void road(){
  fill(50);
  rect(0, 800, width, 200);
  fill(255);
  rect(0, 850, width, 10);
  rect(0, 870, width, 10);
}

void mousePressed(){
  // honk horn by pressing mouse
//   carHorn.play();
//   carHorn.amp(.5);
}
