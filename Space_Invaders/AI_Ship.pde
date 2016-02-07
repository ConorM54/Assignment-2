boolean goRightAI = true;

class AIShip extends Ship
{
  AIShip()
  {
    
  }
  AIShip(float startX, float startY)
  {
    this.pos.x = startX;
    this.pos.y = startY;
    forward = new PVector(1, 0);
    
  }
  
  void update()
  {
    if(goRightAI)
    {
      pos.add(forward);
    }
    else
    {
      pos.sub(forward);
    }
    
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y); 
    stroke(Green);
    fill(Green);
    rectMode(CORNERS);
    rect(-halfW, -5, halfW, 5);
    rectMode(CENTER);
    rect(0,-5, 4, 10);
    popMatrix();
  }
  
  
}