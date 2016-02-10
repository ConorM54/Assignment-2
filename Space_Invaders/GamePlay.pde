void launchGame()
{ 
    background(0);
    stroke(255, 0, 0);
    line(0, boundaryLine, width, boundaryLine);
    stroke(255);
    line(0, 75, width, 75);
    textAlign(LEFT);
    fill(Green);
    text("High Score: " +highscore, 10, 25);
    text("Score: " +PlayerScore, 10, 50);
    text("Lives: ", width/2 -100, 50);
    for (int i = gameObjects.size() - 1; i >= 0; i --)
    {
      GameObject go = gameObjects.get(i);
      if( go.name == "Player One")
      {
        if(((Ship)go).lives ==0)
        {
          gameLaunched = false;
          i = 0;
          GameOver();
        }
        for(int j =0; j < ((Ship)go).lives; j++)
        {
          drawShip( width/2 + (60 *j), 45, Green);
        }
      }
    }
      
    for (int i = invaders.size() - 1; i >= 0; i --)
    {
      AIShip in = invaders.get(i);
      if(invaders.size() % 6 == 0)
      {
         //Increase invaders speed
      }
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
    println(invaders.size());
    if(invaders.size() == 0)
    {
      initSpeed = initSpeed * 1.5;
      newWave(initSpeed);
    }
    if(invaders.size() == 1)
    {
      invaders.get(0).elapsed = 60;
    }
}