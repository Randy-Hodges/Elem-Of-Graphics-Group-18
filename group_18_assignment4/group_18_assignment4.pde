/*

*/
ArrayList<Building> buildings = new ArrayList<Building>();

void setup(){
    size(1000, 1000);
    buildings.add(new Building());

}

void draw(){
    background(100);
    updateBuildings();
    road();
    updateCars();
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

void road(){
  fill(50);
  rect(0, 800, width, 200);
  fill(255);
  rect(0, 850, width, 10);
  rect(0, 870, width, 10);
}
