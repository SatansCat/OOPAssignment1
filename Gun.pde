class Gun
{
  float x;
  float y;
  
  Gun()
  {
    this.x = mouseX;
    this.y = mouseY;
  }
  
  
  void render()
  {
    x = mouseX;
    y = mouseY;
    stroke(0,255,0);
    noFill();
    rectMode(CENTER);
    rect(x,height,width/9,height/2);
  }
  
  void shoot()
  {
    Bullet b = new Bullet(x,height-height/4);
    bullets.add(b);
  }
}