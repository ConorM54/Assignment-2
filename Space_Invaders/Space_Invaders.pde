boolean gameLaunched = false;
boolean highscoreList = false;
boolean GameSelected = true;
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
 //Height at which invaders win
boolean[] keys = new boolean[512];
color Green;
void setup()
{
  size(600,600);
  Green = color(50 ,255, 10);
  Ship ship = new Ship( 'A', 'D', ' ', width/2, height - 20 , color(0, 255, 255));
  gameObjects.add(ship);
  
  displayMenu();
}

void draw()
{
  if(gameLaunched)
  {
     float boundaryLine = height-50;
    background(0);
    stroke(255, 0, 0);
    line(0, boundaryLine , width, boundaryLine);
    
    for(int i = gameObjects.size() - 1 ; i >= 0  ;i --)
    {
      GameObject go = gameObjects.get(i);
      go.update();
      go.render();
    }
  }
  
}

void keyReleased()
{
  keys[keyCode] = false;
}

void keyPressed()
{
  keys[keyCode] = true;
  
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
          gameLaunched = true;
          println("GAME");
        }
        else
        {
          println("Highscore");
        }
    }
  }
}