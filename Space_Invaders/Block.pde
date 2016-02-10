class Block extends GameObject
{
  
  Block()
  {
    
  }
  
  Block(float startX, float startY)
  {
    this.pos.x = startX;
    this.pos.x = startY;
    hitPoints =2;
    
  }
  
  void update()
  {
    
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y); 
    fill(0, 100 * hitPoints, 255);
    stroke(c);
    rect(0, 0, 1, 1);
    popMatrix();
  }
}