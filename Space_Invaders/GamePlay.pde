void launchGame()
{
  if (gameLaunched)
  {
     
    background(0);
    stroke(255, 0, 0);
    line(0, boundaryLine, width, boundaryLine);
    stroke(255);
    line(0, 75, width, 75);
    text(PlayerScore, 50, 50);
    for (int i = gameObjects.size() - 1; i >= 0; i --)
    {
      GameObject go = gameObjects.get(i);
      if( go.name == "Player One")
      {
        if(((Ship)go).lives ==0)
        {
          background(0);
        }
        for(int j =0; j < ((Ship)go).lives; j++)
        {
          drawShip( width/2 + (60 *j), 50, Green);
        }
      }
    }
    
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