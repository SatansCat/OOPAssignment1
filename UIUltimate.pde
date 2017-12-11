class UIUltimate extends UIElement
{
  UIUltimate(float x, float y)
  {
    super(x,y);
  }
  
  
  void render()
  {
    if(charge == 100)
    {
      fill(255,255,0);
      stroke(255,255,0);
    }
    else
    {
      fill(0,255,0);
      stroke(0,255,0);
    }
    textAlign(TOP,LEFT);
    textSize(50);
    text("Q",x,y);
    line(x,y,map(charge,0,100,50,500),y);
  }
  
  
  void use()
  {
    charge = 0;
    enemys.clear();
  }
}