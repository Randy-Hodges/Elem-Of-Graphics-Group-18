class Sun{
    float startX, startY, radius, angle;
    color start_color, end_color;
    
    Sun(float startX, float startY, float radius, float angle) {
        this.startX = startX;
        this.startY = startY;
        this.radius = radius;
        this.angle = angle;
        start_color = color(255, 200, 63);
        end_color = color(255, 72, 0);
}
    
    void display() {
        pushMatrix();
        ellipseMode(CENTER);
        // sun moves around center point
        rotate(angle);
        translate(50,0);
        fill(lerpColor(start_color, end_color,(millis() % 6000) / 6000.0));
        noStroke();
        ellipse(startX, startY, radius, radius);
        angle += 0.01;
        if (radius > 0) {
            radius = radius - 0.1;
    }
        popMatrix();
}
}
