class Ball {
  private PVector velocity, position;
  
  PVector getVelocity() { 
    return this.velocity;
  }
  
  PVector getPosition() {
    return position; 
  }
  
  public Ball(PVector screen) {
     velocity = new PVector(1,0);
     position = new PVector(screen.x/2,screen.y/2);
  }
  
  void Move(PVector screen, PVector change) {
    position.x += velocity.x;
    position.y += velocity.y;
  }
  
  void bounce(PVector change) {
     velocity.x = change.x;
     velocity.y = change.y;
  }
  
}
