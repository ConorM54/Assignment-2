abstract class GameObject
{
  PVector pos;
  PVector forward;
  float w;
  float halfW;
  float speed = 5.0f;
  color c; 
  float H;
   float halfH;
  GameObject()
  {
    // Constructor chaining
    this(width * 0.5f, height  * 0.5f, 50);     
  }
  
  GameObject(float x, float y, float w)
  {
    pos = new PVector(x, y);
    this.w = w; // Disambiguate w by using this
    this.halfW = w * 0.5f;
    
  }
  
  abstract void update();  
  abstract void render();
  
}