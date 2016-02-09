boolean goRightAI = true;

class AIShip extends Ship
{
  boolean shoot;
  PVector down;
  
  AIShip()
  {
    
  }
  AIShip(float startX, float startY, color c, int points, String name)
  {
    this.pos.x = startX;
    this.pos.y = startY;
    this.c = c;
    this.score = points;
    forward = new PVector(6f, 0);
    w = 40;
    halfW  = w/2;
    H = 10;
    halfH = H/2;
    this.score = points;
    this.name = name;
    shoot = false;
    down = new PVector(0, 0.5);
    
  }
  
  void update()
  {
    if(elapsed >60)
    {
      if(goRightAI )
      {
        pos.add(forward);
        
      }
      else
      {
        pos.sub(forward);
      }
      elapsed = 0;
    }
    if (shoot )
    {
      Blast blast = new Blast();
      blast.pos.x = pos.x -halfW;
      blast.pos.y = pos.y;
      blast.forward = PVector.mult(down, 10);
      blast.c = 255;
      blast.name = name;
      gameObjects.add(blast);
      shoot = false;
    }
    elapsed++;
  }
  
  void goDown()
  {
   
    
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