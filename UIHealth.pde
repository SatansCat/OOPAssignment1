class UIHealth extends UIElement
{
  UIHealth(float x, float y)
  {
    super(x,y);
  }
  
  void render()
  {
    fill(255,0,0);
    stroke(255,0,0);
    textAlign(TOP,LEFT);
    textSize(50);
    text("H",x,y);
    line(x,y,map(health,0,100,550,950),y);
    //println("Health: " + health);
  }
  
  void update()
  {
    
  }
}