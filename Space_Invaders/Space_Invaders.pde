boolean gameLaunched = false;
boolean highscoreList = false;
boolean GameSelected = true;
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
ArrayList<AIShip> invaders = new ArrayList<AIShip>();
int counter = 0;
boolean[] keys = new boolean[512];
int PlayerScore;
color Green;
void setup()
{
  size(600, 600);
  Green = color(50, 255, 10);
  Ship ship = new Ship( 'A', 'D', ' ', width/2, height - 20, Green, "Player One");

  gameObjects.add(ship);
  newWave();
  displayMenu();
}

void draw()
{
  if (gameLaunched)
  {
    float boundaryLine = height-50;
    background(0);
    stroke(255, 0, 0);
    line(0, boundaryLine, width, boundaryLine);
    text(PlayerScore, 50, 50);
    
    for (int i = invaders.size() - 1; i >= 0; i --)
    {
      AIShip in = invaders.get(i);
      
      if (in.pos.x > width - in.halfW)
      {
        goRightAI = false;
        for (int j = invaders.size() - 1; j >= 0; j --)
        {
          invaders.get(j).goDown();
        }
      }
      
      if (in.pos.x < in.halfW)
      {
        goRightAI = true;
        for (int j = invaders.size() - 1; j >= 0; j --)
        {
          invaders.get(j).goDown();
        }
      }
    } 

    for (int i = gameObjects.size() - 1; i >= 0; i --)
    {
      GameObject go = gameObjects.get(i);
      go.update();
      go.render();
    }
    checkCollisions();

    if (counter % 240 == 0)
    {
      int i = (int)random(0, invaders.size());
      invaders.get(i).shoot = true;
      counter =0;
    }
    counter++;
  }
}

void keyReleased()
{
  keys[keyCode] = false;
}

void keyPressed()
{
  keys[keyCode] = true;

  if (!gameLaunched && !highscoreList)
  {
    if (key == CODED)
    {
      if (keyCode == UP || keyCode == DOWN)
      {
        GameSelected = !GameSelected;
        displayMenu();
      }
    }
    if (key == ENTER || key == ' ')
    {
      if (GameSelected)
      {
        PlayerScore = 0;
        gameLaunched = true;
        println("GAME");
      } else
      {
        println("Highscore");
      }
    }
  }
}

void checkCollisions()
{
  for (int i = gameObjects.size() - 1; i >= 0; i --)
  {
    GameObject go = gameObjects.get(i);
    if (go instanceof Blast)
    {

      for (int  j= gameObjects.size() - 1; j >= 0; j --)
      {
        GameObject other = gameObjects.get(j);
        if (other instanceof AIShip)
        {
          if (go.pos.x >= other.pos.x -other.halfW  && go.pos.x < other.pos.x+ other.halfW   && go.pos.y < other.pos.y + other.halfH && go.pos.y > other.pos.y - other.halfH  )
          {
            for (int  k= gameObjects.size() - 1; k >= 0; k --)
            {
              GameObject source = gameObjects.get(k);

              if (source instanceof Ship && ! (source instanceof AIShip))
              {
                if ( ((Ship)source).name.equals(((Blast)go).name) )
                {
                  println(((Ship)source).name);
                  println( ((Blast)go).name );
                  PlayerScore = PlayerScore + ((AIShip)other).score;
                  gameObjects.remove(go);
                  gameObjects.remove(other);
                  i=0;
                  j=0;
                }
              }
            }
          }
        }
        if (other instanceof Ship && ! (other instanceof AIShip))
        {
          if (go.pos.x >= other.pos.x -other.halfW  && go.pos.x < other.pos.x+ other.halfW   && go.pos.y < other.pos.y + other.halfH && go.pos.y > other.pos.y - other.halfH  )
          {
             if (! ((Ship)other).name.equals(((Blast)go).name) )
             {
              gameObjects.remove(go);
              ((Ship)other).lives--;
              i=0;
              j=0;
             }
          }
        }
      }
    }
  }
}




void newWave()
{

  for ( int j = 0; j < 5; j++)
  {
    color shipColor = color(255, 0, (50 * j));
    for (int i = 0; i< 7; i++)
    {
      AIShip invader = new AIShip(20 +(50*i ), 100 + (30 * j), shipColor, (2000 - (300 *j)), "AI");
      invaders.add(invader);
      gameObjects.add(invader);
    }
  }
}