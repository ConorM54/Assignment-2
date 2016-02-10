class Blast extends GameObject
{
  String name;
  
  Blast()
  {
    forward = new PVector(0, -005);
    speed = 10.0f;
  }
  
  
  
  void render()
  {
    stroke(c);
    pushMatrix();
    translate(pos.x, pos.y);
    line(0, -5, 0, 5);
    popMatrix();    
  }
  
  void update()
  {
     
    //forward.mult(speed);
    pos.add(forward);
    
    if ( pos.y < 75 || pos.y > height )
    {
      gameObjects.remove(this);
    }
  }
}
  
  
  