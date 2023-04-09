

class Bully {
    PVector pos, direction;
    float speed;
    int num_balls_carried;
    // Dodgeball[] all_balls;
    int difficulty;
    int EASY = 0;
    int MEDIUM = 1;
    int HARD = 2;
    PVector player_pos, player_vel;
    Bully(int difficulty, PVector position){
        pos = position.copy();
        this.difficulty = difficulty;
        switch (difficulty){
            case EASY:
                speed = 3;
                break;
            case MEDIUM:
                speed = 5;
                break;
            case HARD:
                speed = 7;
                break;
            default:
                println("invalid difficulty provided to bully");
                break;
        }
    }

    void move(){

    }

    void throwBall(){
        if (frameCount % (frameRate*3) == 0){
            println("threw ball");
        }
    }



}