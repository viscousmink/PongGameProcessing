Ball ball;
Player player;
AI ai;
PVector Screen;
boolean hasMovedPlayer;
int frame;
int lastMove;

void setup () {
  Screen = new PVector(500, 400);
  size(500,400);
  background(0);
  noStroke();
  frameRate(90);
  ball = new Ball(Screen);
  player = new Player(Screen);
  ai = new AI(Screen);
  hasMovedPlayer = false;
  frame = 0;
  lastMove = 0;
}

void draw() {
  frame += 1;
  if(frame % 18 == 0) {
    ai.determine(ball.getVelocity(), ball.getPosition(), Screen);
  }
  if(frame % 60 == 0) {
    hasMovedPlayer = false; 
  }
  background(0); 
  fill(255);
  ellipse(ball.getPosition().x, ball.getPosition().y, 15, 15);
  rect(player.getPosition().x, player.getPosition().y, 15, 40);
  rect(ai.getPosition().x, ai.getPosition().y, 15, 40);
  ball.Move();
  if(Collision() == true) {
    if(hasMovedPlayer) {
      float y = 0;
      if(lastMove == 1) {
        y = -1;
      }
      if(lastMove == -1) {
        y = 1; 
      }
      ball.bounce(new PVector(-ball.getVelocity().x, y));
    }
    else {
      ball.bounce(new PVector(-ball.getVelocity().x, ball.getVelocity().y));
    }
  }
  if(wallCollision()) {
    ball.bounce(new PVector(ball.getVelocity().x, -ball.getVelocity().y));
  }
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == UP) {
      player.Move(10, Screen);
      hasMovedPlayer = true;
      lastMove = 1;
    }
    if(keyCode == DOWN) {
      player.Move(-10, Screen);
      hasMovedPlayer = true;
      lastMove = -1;
    }
  }
}

boolean Collision() {
  if(ball.getPosition().x == ai.getPosition().x) {
    if(ball.getPosition().y <= ai.getPosition().y + 40 && ball.getPosition().y >= ai.getPosition().y) {
      return true;
    }
  }
  if(ball.getPosition().x == player.getPosition().x + 15) {
    if(ball.getPosition().y <= player.getPosition().y + 40 && ball.getPosition().y >= player.getPosition().y) {
      return true; 
    }
  }
  
  return false;
}

boolean wallCollision() {
  if(ball.getPosition().y >= Screen.y) { 
    return true;
  }
  if(ball.getPosition().y <= 0) { 
    return true;
  }
  if(ball.getPosition().x < 0) {
    AIwins(); 
  }
  if(ball.getPosition().x > Screen.x) {
    PLAYERwins(); 
  }
  
  return false;
}

void PLAYERwins() {
  println("Ya won kid");
  
  exit();
  
  return; 
}

void AIwins() {
  println("Ya lost kid");
  
  exit();
  
  return;
}
