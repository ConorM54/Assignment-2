import controlP5.*;
boolean gameLaunched = false;
boolean highscoreList = false;
boolean GameSelected = true;

ControlP5 cp5;
color Green;
void setup()
{
  size(600,600);
  Green = color(50 ,255, 10); 
  displayMenu();
}

void draw()
{
  if(!gameLaunched && !highscoreList)
  {
   
  }
}
void keyPressed()
{
  
  if(!gameLaunched && !highscoreList)
  {
    if(key == CODED)
    {
      if(keyCode == UP || keyCode == DOWN)
      {
        GameSelected = !GameSelected;
        displayMenu();
      }
      if(keyCode ==ENTER || keyCode == ' ')
      {
        if(GameSelected)
        {
          //LaunchGame
        }
        else
        {
          //Highscore
        }
      }
    }
  }
}
void displayMenu()
{
    
    PFont font;
    
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