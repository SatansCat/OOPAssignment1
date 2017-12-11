class UITeleport extends UIElement
{
  float size;
  
  UITeleport(float x, float y, float size)
  {
    super(x, y);
    this.size = size;
  }
  
  void render()
  {
   
    stroke(0,255,0);
    ellipse(x,y, size+3, size+3);
    noStroke();
    fill(100,100,255);
    arc(x,y,size,size,0, (TWO_PI/6)*time);
    if(time == 6)
    {
      fill(255);
      textAlign(CENTER,CENTER);
      textSize(200);
      text("E",x,y-height/40);
    }
    
  }
  
  void update()
  {
    if (time <6)
    {
      time++; //time is a global if you were wondering
    }
  }
  
  void use()
  {
    time = 0;
    for(Enemy e:enemys)
    {
      e.y = height/2.5 - e.y + height-height/3.5;
      e.x = width-width/10 - e.x + width/10;
    }
  }
}