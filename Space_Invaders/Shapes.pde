void drawShip(float x, float y, color c)
{
  float H =10;
  float halfH = H/2;
  float w= 50;
  float halfW = w/2;
    stroke(c);
    fill(c);
    rectMode(CORNERS);
    rect(x -halfW, y -halfH, x + halfW, y +halfH);
    rectMode(CENTER);
    rect(x, y -halfH, H, H);
}