class BigE extends Enemy
{
  
  BigE(float x, float y, float size, int hits)
  {
    super(x,y,size,hits);
  }
  
  void render()
  {
    float dist = map(dist(0,y,0,(height-height/3.5)), height/2.5, height-height/3.5, 30, 50);
    
    size2 = size/dist;
    if(time<4)
    {
      stroke(255,0,0);
    }
    else
    {
      stroke(255, 174, 0);
    }
    
    noFill();
    ellipse(x,y,size2,size2);
    for(int i = 4; i>0; i--)
    {
      ellipse(x,y,(size2/5)*i,(size2/5)*i);
    }
  }
  
  void update()
  {
    if(frameCount % 60 == 0)
    {
      time--;
    }
  }
  
  void harm()
  {
    health -= 20;
  }
  
}