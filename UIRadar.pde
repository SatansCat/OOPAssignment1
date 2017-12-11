class UIRadar extends UIElement
{
  
  float size;
  float speed;
  float radius;
  float theta;
  color Color;
  
  UIRadar(float x, float y, float size, float speed)
  {
    super(x,y);
    this.size = size;
    this.radius = size/2;
    this.theta = 0;
    this.speed = speed;
    Color = color(0,255,0);
  }
  
  void render()
  {
    int trailLength = 200;
    stroke(Color);
    noFill();
    ellipse(x,y,size,size);
    
    for(int i = 1; i < trailLength; i++)
    {
      stroke(Color,255/i);
      float lx = x + cos(theta -i *speed) * radius;
      float ly = y - sin(theta -i *speed) * radius;
      line(x,y,lx,ly);
    }
  }
  
  void update()
  {
    theta += speed;
  }
}