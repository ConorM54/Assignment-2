boolean gameLaunched = false;
boolean highscoreList = false;
boolean GameSelected = true;
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
ArrayList<AIShip> invaders = new ArrayList<AIShip>();
 //Height at which invaders win
boolean[] keys = new boolean[512];
color Green;
void setup()
{
  size(600,600);
  Green = color(50 ,255, 10);
  Ship ship = new Ship( 'A', 'D', ' ', width/2, height - 20 , Green);
  gameObjects.add(ship);
  
  AIShip invader = new AIShip(200, 200);
  invaders.add(invader);
  gameObjects.add(invader);
  
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
    for(int i = invaders.size() - 1 ; i >= 0  ;i --)
    {
      AIShip in = invaders.get(i);
      if(in.pos.x > width - 15)
      {
        goRightAI = false;
      }
      if(in.pos.x < 15)
      {
        goRightAI = true;
      }
    } 
        
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