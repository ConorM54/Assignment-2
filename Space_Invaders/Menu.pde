void displayMenu()
{
    
    
    
    background(0);
    fill(Green);
    
     font = createFont("space_invaders.ttf", 20);
     textFont(font, 40);
     textAlign(CENTER);
     text("Space Invaders", width/2, height/3);
     if(GameSelected)
     {
       textFont(font, 25);
       fill(255);
     }
     else
     {
       textFont(font, 18);
       fill(Green);
     }
       text("Play Game", width/2, (height/2) +50, +10);
      if(GameSelected)
     {
       textFont(font, 18);
       fill(Green);
     }
     else
     {
       textFont(font, 25);
       fill(255);
     }
       text("High Score", width/2, height/2 +100, +10);
}