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
    }
    if(key == ENTER || key == ' ')
    {
        if(GameSelected)
        {
          println("GAME");
        }
        else
        {
          println("Highscore");
        }
    }
  }
}