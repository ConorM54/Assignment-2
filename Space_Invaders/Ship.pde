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
    forward.x = 1;
    forward.y = 0;
    
    if (keys[left])
    {
      pos.sub(forward);
    }
    if (keys[right])
    {
      pos.add(forward);
    }
    
     if (pos.x - halfW < 0)
    {
      pos.x = 0 + halfW;
    }
    
    if (pos.x + halfW > width)
    {
      pos.x = width - halfW;
    }
    
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y); 
    stroke(c);
    fill(c);
    rectMode(CORNERS);
    rect(-halfW, -5, halfW, 5);
    rectMode(CENTER);
    rect(0,-5, 4, 10);
    popMatrix();
  }
  
}