boolean goRightAI = true;

class AIShip extends Ship
{
  AIShip()
  {
    
  }
  
  void update()
  {
    if(goRightAI)
    {
      forward.x = 1;
    }
    else
    {
      forward.x = -1;
    }
    
    pos.add(forward)
    
  }
  
  void render()
  {
  }
  
  
}