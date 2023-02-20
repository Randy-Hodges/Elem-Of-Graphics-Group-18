Sun sun;
Rays rays;

void setup(){
    size(1000, 1000);
    smooth();
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

void draw(){
    pushMatrix();
    translate(width/2, height/2);
    fill(0);
    ellipse(0, 0, 1, 1);
    pushMatrix();
    sun.display();
    rays.display();
    popMatrix();
    popMatrix();
    

    
}
