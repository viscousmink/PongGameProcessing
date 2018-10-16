class AI {
  PVector position;
  
  public AI(PVector screen) {
     position = new PVector(screen.x - 35, screen.y/2 - 10);
  }
  
  PVector getPosition() {
    return position; 
  }
  
  void determine(PVector ballV, PVector ballLoc, PVector screen) {
    if(ballV.x < 0) {
      return;
    }
    
    if(ballV.y == 0) {
      this.MoveTo((float) (ballLoc.y)); 
    }
    
    float end = 0, distanceToGo = 0;
    distanceToGo = screen.x - ballLoc.x;
    
    end = (distanceToGo * ballV.y) + ballLoc.y;
    
    println(end + " " + distanceToGo + " " + ballLoc.x + " ");
    
    MoveTo(end);
  }
  
  void MoveTo(float loc) {
    int location = (int) loc;
    if(location > this.position.y+20) {
      position.y += 5; 
    }
    else if(location < this.position.y+20) {
      position.y -= 5; 
    }
  }
}
