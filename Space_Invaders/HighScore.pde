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
  textFont(font, 30);
  
  text("Your Score: " + PlayerScore, 200, height/3 +100);
  text("High Score: " + highscore, 200, height/3 +200);
  
  
  
}

void displayHighscore()
{
  background(0);
}