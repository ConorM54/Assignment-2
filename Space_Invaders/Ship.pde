class Ship extends GameObject
{
   char left;
   char right;
   char fire;
   int lives;
   
   Ship()
  {
    
    super(width * 0.5f, height  * 0.5f, 50);       
  }
  
  Ship( char left, char right, char fire, float startX, float startY, color c)
  {
    super(startX, startY, 50);
    
    this.left = left;
    this.right = right;
    this.fire = fire;
    this.c = c;
    lives = 10;
  }
  
  void update()
  {
    if (keys[left])
    {
      pos.x -= 0.1f;
    }
    if (keys[right])
    {
      pos.y += 0.1f;
    }
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y); 
    stroke(255);
    line(- halfW, halfW, 0, - halfW);
    line(0, - halfW, halfW, halfW);
    line(halfW, halfW, 0, 0);
    line(- halfW, halfW, 0, 0);
    popMatrix();
  }
  
}