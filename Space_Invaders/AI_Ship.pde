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
    forward = new PVector(.5f, 0);
    
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
  void goDown()
  {
    PVector down = new PVector(0, 3);
    
    pos.add(down);
  }
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y); 
    stroke(Green);
    fill(Green);
    shape(Alien, 0, 0, w, 10);
    popMatrix();
  }
  
  
}