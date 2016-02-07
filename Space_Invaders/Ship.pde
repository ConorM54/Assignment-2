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
    
     if (pos.x < 0)
    {
      pos.x = width;
    }
    
    if (pos.x > width)
    {
      pos.x = 0;
    }
    
    if (pos.y < 0)
    {
      pos.y = height;
    }
    
    if (pos.y > height)
    {
      pos.y = 0;
    }
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y); 
    stroke(c);
    rectMode(CORNERS);
    rect(-halfW, -5, halfW, 5);
    popMatrix();
  }
  
}