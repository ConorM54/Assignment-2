boolean gameLaunched = false;
boolean highscoreList = false;
boolean GameSelected = true;
boolean gameOverCheck = false;
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
ArrayList<AIShip> invaders = new ArrayList<AIShip>();
int counter = 0;
boolean[] keys = new boolean[512];
int PlayerScore;
int highscore;
color Green;
float boundaryLine;
PFont font;
float initSpeed;

void setup()
{
  size(600, 600);
  Green = color(50, 255, 10);
  boundaryLine= height-50;
  initSpeed = 10f;
  newWave(initSpeed);
  loadHighscore();
  newShip();
  
 
  //newBarrier(width/2, 500, 20, 50);
  
  displayMenu();
}

void draw()
{
  if(gameLaunched)
  {
    launchGame();
  }
  if(highscoreList)
  {
    displayHighscore();
  }
}

void keyReleased()
{
  keys[keyCode] = false;
}

void keyPressed()
{
  keys[keyCode] = true;

  if (!gameLaunched && !highscoreList && !gameOverCheck)
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
  if(gameOverCheck || highscoreList)
  {
    gameOverCheck= false;
    highscoreList = false;
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
                  invaders.remove(other);
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
        //Blast hitting block
        if(other instanceof Block)
        {
          if( go.pos.x <= other.pos.x + other.halfW && go.pos.x > other.pos.x && go.pos.y >= other.pos.y && go.pos.y <= other.pos.y + other.halfW)
          {
            gameObjects.remove(other);
            gameObjects.remove(go);
            i=0;
            j=0;
          }
         
         
        }
      }
    }
    if( go instanceof AIShip)
    {
      if( go.pos.y > boundaryLine)
      {
        GameOver();
      }
    }
  }
}

void newBarrier(float x, float y, float h, float w)
{
  for(int i = 0; i < w; i++)
  {
    for(int j = 0; j < h; j++)
    {
      Block b = new Block(x+ (2 *i) , y + (2*j));
      gameObjects.add(b);
    }
  }
}


void newWave(float AIspeed)
{

  for ( int j = 0; j < 5; j++)
  {
    color shipColor = color(255, 0, (50 * j));
    for (int i = 0; i< 7; i++)
    {
      AIShip invader = new AIShip(30 +(50*i ), 100 + (30 * j), shipColor, (20 - (3 *j)), "AI", AIspeed);
      invaders.add(invader);
      gameObjects.add(invader);
    }
  }
}

void loadHighscore()
{
  String lines[] = loadStrings("highscore.txt");
  
  
  String s= lines[0];
  highscore =(int) Float.parseFloat(s);
 
}
void newShip()
{
  Ship ship = new Ship( 'A', 'D', ' ', width/2, height - 20, Green, "Player One");
  gameObjects.add(ship);
}
    