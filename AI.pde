class AI {
  PVector position;
  
  public AI(PVector screen) {
     position = new PVector(screen.x - 35, screen.y/2 - 10);
  }
  
  PVector getPosition() {
    return position; 
  }
}
