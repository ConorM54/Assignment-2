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
  fill(255);
  textAlign(LEFT);
  text("Your Score: " + PlayerScore, 50, height/3 +100);
  if(PlayerScore > highscore)
  {
    highscore = PlayerScore;
    fill(255);
    text("NEW High Score: " + PlayerScore, 50, height/3 +200);
    String lines[] = new String[1];
    lines[0] = str(highscore);
    saveStrings("highscore.txt", lines);
  }
  else
  {
   fill(255);
   text("High Score: " + highscore, 200, height/3 +200);
  }
  fill(255);
  textSize(20);
  text("Press any key to continue", 10, height -50);
  
}

void displayHighscore()
{
  background(0);
}