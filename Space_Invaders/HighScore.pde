void GameOver()
{
  for (int i = gameObjects.size() - 1; i >= 0; i --)
  {
      GameObject go = gameObjects.get(i); 
      gameObjects.remove(go);
  }
  
  for (int i = invaders.size() - 1; i >= 0; i --)
   {
      AIShip in = invaders.get(i);
      invaders.remove(in);
   }
   
  gameLaunched = false;
  background(0);
  textAlign(CENTER);
  textFont(font, 40);
  text("Game Over", width/2, height/3);
  
  
}

void displayHighscore()
{
  background(0);
}