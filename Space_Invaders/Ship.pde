class Ship extends GameObject
{
   char left;
   char right;
   char fire;
   int lives;
   int elapsed;
   int score;
  
  
   
   Ship()
  {
    
    super(width * 0.5f, height  * 0.5f, 50);       
  }
  
  Ship( char left, char right, char fire, float startX, float startY, color c, String name)
  {
    super(startX, startY, 50);
    
    this.left = left;
    this.right = right;
    this.fire = fire;
    this.c = c;
    forward = new PVector(1, 0);
    lives = 3;
    H = 20;
    halfH = H/2;
    score = 0;
    this.name = name;
    speed = 1.5f;
    
  }
  
  void update()
  {
    
    
    if (keys[left])
    {
      pos.sub(PVector.mult(forward, speed));
    }
    if (keys[right])
    {
       pos.add(PVector.mult(forward, speed));
    }
    if (keys[fire] && elapsed >60 )
    {
      Blast blast = new Blast();
      blast.pos.x = pos.x -halfW;
      blast.pos.y = pos.y;
      blast.pos.add(PVector.mult(forward, 26));
      blast.c = c;
      blast.name = name;
      gameObjects.add(blast);
      elapsed = 0;
      
    }
    
     if (pos.x - halfW < 0)
    {
      pos.x = 0 + halfW;
    }
    
    if (pos.x + halfW > width)
    {
      pos.x = width - halfW;
    }
    elapsed++;
  }
  
  void render()
  {
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y); 
    drawShip(0, 0, c);
    popMatrix();
  }
  
}