class Sun{
    float startX, startY, sun_radius, angle;
    color start_color, end_color;
    Rays rays;
    
    Sun(float startX, float startY, float sun_radius, float angle) {
        this.startX = startX;
        this.startY = startY;
        this.sun_radius = sun_radius;
        this.angle = angle;
        start_color = color(255, 200, 63);
        end_color = color(255, 72, 0);
        rays = new Rays(-100, 500, 1, 10, -100);
}
    
    void display() {
        pushMatrix();
        ellipseMode(CENTER);
        // sun moves around center point
        rotate(angle);
        fill(lerpColor(start_color, end_color,(millis() % 6000) / 6000.0));
        noStroke();
        ellipse(startX, startY, sun_radius, sun_radius);
        angle += 0.01;
        if (sun_radius > 0) {
            sun_radius = sun_radius - 0.1;
        }
        rays.display();
        popMatrix();
}
}
