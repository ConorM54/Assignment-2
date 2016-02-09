boolean goRightAI = true;

class AIShip extends Ship
{
  float points;
  AIShip()
  {
    
  }
  AIShip(float startX, float startY, color c, float points)
  {
    this.pos.x = startX;
    this.pos.y = startY;
    this.c = c;
    this.points = points;
    forward = new PVector(6f, 0);
    w = 40;
    halfW  = w/2;
    H = 10;
    halfH = H/2;
    
  }
  
  void update()
  {
    if(elapsed >12)
    {
      if(goRightAI )
      {
        pos.add(forward);
        
      }
      else
      {
        pos.sub(forward);
      }
      elapsed =0;
    }
    elapsed++;
  }
  
  void goDown()
  {
    PVector down = new PVector(0, 1);
    
    pos.add(down);
  }
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y); 
    stroke(c);
    fill(c);
    rectMode(CORNERS);
    rect(-halfW, -H, halfW, halfH);
    rect(-halfW, halfH, -halfW +halfH, H);
    rect(halfW, halfH, halfW -halfH, H);
    rectMode(CENTER);
    fill(0);
    
    rect(-7, -4, 5, 5);
    rect(7, -4, 5,5);
    
    popMatrix();
  }
  
  
}