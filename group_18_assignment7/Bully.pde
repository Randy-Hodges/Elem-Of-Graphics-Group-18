

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
        if (true || frameCount % int(frameRate*3) == 0){
            PVector vec_towards_player = player_pos.copy().sub(pos);
            float variation = random(-spread_angle, spread_angle);
            vec_towards_player.rotate(variation);
            line(pos.x, pos.y, pos.x + vec_towards_player.x*100, pos.y + vec_towards_player.y*100);
        }

    }

    void display(){
        fill(0);
        ellipse(player_pos.x, player_pos.y, 10, 10);
        imageMode(CENTER);
        ellipse(pos.x, pos.y, 10, 10);
        imageMode(CORNER);
    }



}