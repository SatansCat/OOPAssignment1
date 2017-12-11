class Bullet
{
  float x;
  float y;
  float speed;
  boolean toDestroy;
  
  Bullet(float x, float y)
  {
    this.x = x;
    this.y = y;
    speed = 5;
    toDestroy = false;
  }
  
  void render()
  {
    line(x,y, x, y-20);
  }
  
  void update()
  {
    y -= speed;
    for(Enemy e:enemys)
    {
      if(dist(x,y,e.x,e.y) <= e.size2)
      {
        toDestroy = true;
        e.hits--;
        score = score+10;
        if(charge <100)
        {
          charge = charge+5;
        }
      }
    }
  }
  
}