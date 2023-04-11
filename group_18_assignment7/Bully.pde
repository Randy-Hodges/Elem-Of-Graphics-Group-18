

class Bully {
    // Physics
    PVector pos, vel;
    float speed;
    PVector player_pos, player_vel;
    float boundary_buffer = 30;
    // Balls
    int num_balls_carried;
    Dodgeball[] all_balls;
    float spread_angle; // represents the max angle that a ball can be shot at player
    // Difficulty
    int difficulty;
    final int EASY = 0;
    final int MEDIUM = 1;
    final int HARD = 2;
    float hard_avoiding_dist = 50;
    // Sprites
    PImage[] run_ball_sp;
    PImage[] run_sp;
    PImage[] throw_sp;
    String cur_anim = "run";
    int runb_idx;
    int run_idx;
    int throw_idx;
    // Other
    int decision_rate; // how often [in sec] the player switches direction, goes for a ball, etc

    Bully(float x, float y, int difficulty, Dodgeball[] all_balls){
        // Difficulty params
        this.difficulty = difficulty;
        switch (difficulty){
            case EASY:
                speed = 3;
                spread_angle = PI/4;
                break;
            case MEDIUM:
                speed = 5;
                spread_angle = PI/8;
                break;
            case HARD:
                speed = 7;
                spread_angle = PI/16;
                break;
            default:
                println("invalid difficulty (int) provided in bully constructor");
                break;
        }
        // Physics
        pos = new PVector(x, y);
        vel = PVector.random2D().mult(speed);
        player_pos = new PVector(width/2, 3*height/4);
        // Other
        decision_rate = int(random(3, 6));
        this.all_balls = all_balls;
        loadSprites();
    }

    void loadSprites(){
        run_ball_sp = new PImage[2];
        run_sp = new PImage[2];
        throw_sp = new PImage[3];
        // Technically speaking, doing multiple loops is more flexible but idc rn
        for (int i = 0; i < 2; i++) {
            String image_name = "Bully Sprite/runBall/runBall-" + nf(i+1, 1) + ".png";
            run_ball_sp[i] = loadImage(image_name);
            image_name = "Bully Sprite/run/run-" + nf(i+1, 1) + ".png";
            run_sp[i] = loadImage(image_name);
            image_name = "Bully Sprite/throw/throwBall-" + nf(i+1, 1) + ".png";
            throw_sp[i] = loadImage(image_name);
        }
        throw_sp[2] = loadImage("Bully Sprite/throw/throwBall-3.png");
    }

    void update(){
        move();
        throwBall();
        display();
    }

    void move(){
        // Move
        pos.x += vel.x;
        pos.y += vel.y;
        // Stay in Bounds
         if (pos.x < boundary_buffer || pos.x > width - boundary_buffer) {
            vel.x *= -1;
        }
        if (pos.y < boundary_buffer || pos.y > height/2 - boundary_buffer) {
            vel.y *= -1;
        }
        // Choose to move another way
        if (frameCount % int(frameRate*decision_rate) == 0){
            vel = PVector.random2D().mult(speed);
        }
        // Changes due to difficulty level
        if (difficulty == HARD){
            float min_len, ball_idx;
            float[] stuff = new float[2]; // Processing not allowing me to do things how I want to
            stuff = findNearestThrownBall();
            min_len = stuff[0];
            ball_idx = stuff[1];
            if (min_len < hard_avoiding_dist){
                // Move away from closest ball
                vel = pos.copy().sub(all_balls[int(ball_idx)].pos).normalize().mult(speed);
            }
        }
    }

    float[] findNearestThrownBall(){
        // Finds the closest thrown ball to the enemy
        float min_length = Float.MAX_VALUE;
        int ball_idx = 0;
        for(int i = 0; i < all_balls.length; i++){
            if (all_balls[i].dead){
                continue;
            }
            float enemy_to_ball_dist = all_balls[i].pos.dist(pos);
            if (enemy_to_ball_dist < min_length){
                ball_idx = i;
                min_length = enemy_to_ball_dist;
            }
        }
        float[] answer = {min_length, ball_idx};
        return answer;
    }

    void throwBall(){
        if (frameCount % int(frameRate*3) == 0){
            PVector vec_towards_player = player_pos.copy().sub(pos);
            float variation = random(-spread_angle, spread_angle);
            vec_towards_player.rotate(variation);
            line(pos.x, pos.y, pos.x + vec_towards_player.x*100, pos.y + vec_towards_player.y*100);
        }
    }

    void display(){
        PImage sprite;
        float sprite_time = 20;
        // OK this could be WAAAAY more efficient/clean with doing some kind of idx += 1 and edge case rules. 
        switch (cur_anim){
            case "run-ball":
                sprite_time = 20;
                if (frameCount % sprite_time == 0){
                    if (runb_idx == 0){
                        runb_idx = 1;
                    }
                    else {
                        runb_idx = 0;
                        cur_anim = "run";
                    }
                }
                sprite = run_ball_sp[runb_idx];
                break;
            case "throw-ball":
                sprite_time = 20;
                if (frameCount % sprite_time == 0){
                    if (throw_idx == 0){
                        throw_idx = 1;
                    }
                    else if (throw_idx == 1){
                        throw_idx = 2;
                    }
                    else {
                        throw_idx = 0;
                        cur_anim = "run";
                    }
                }
                sprite = throw_sp[throw_idx];
                break;
            default: // running
                sprite_time = 20;
                if (frameCount % sprite_time == 0){
                    if (run_idx == 0){
                        run_idx = 1;
                    }
                    else {
                        run_idx = 0;
                    }
                }
                sprite = run_sp[run_idx];
                break;
        }
        fill(0);
        imageMode(CENTER);

        pushMatrix();
        translate(pos.x, pos.y);
        scale(.3);
        image(sprite, 0, 0);
        ellipse(0, 0, 10, 10);
        popMatrix();
        
        imageMode(CORNER);
        scale(1);
    }
}