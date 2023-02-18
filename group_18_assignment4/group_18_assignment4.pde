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
