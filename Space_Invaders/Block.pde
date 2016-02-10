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
    c = color(0, 0, 255);
  }
  
  void update()
  {
    
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y); 
    fill(c);
    stroke(c);
    rect(0, 0, 1, 1);
    popMatrix();
  }
}