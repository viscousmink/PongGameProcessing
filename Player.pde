class Player {
  private PVector position;
  private PVector velocity;
  
  public Player(PVector Screen) {
    position = new PVector(20, Screen.y/2 - 10);
  }
  
  PVector getPosition() {
    return position; 
  }
  
  PVector getVelocity() {
     return velocity;
  }
  
  void Move(int change, PVector screen) {
    if(position.y <= 0) {
      if(change < 0) {
        println("Bounds hit"); 
      }
      else {
        return;
      }
    }
    if(position.y+40 >= screen.y) {
      if(change > 0) {
        println("Bounds hit");
      }
      else {
        return;
      }
    }
    position.y -= change;
  }
  
}
