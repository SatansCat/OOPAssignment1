class Visor
{
  PVector Lhalf;
  PVector Rhalf;
  int part;
  int guage;
  
  Visor()
  {
    part = 1;
    guage = 0;
  }
  
  void display()
  {
      stroke(0,255,0);
      line(width/2, height/4, width/1.01, height/11);
      line(width/2, height/4, width-width/1.01, height/11);
      
      line(width/1.01, height/11, width/1.01, height/1.5);
      line(width-width/1.01, height/11, width-width/1.01, height/1.5);
      
      line(width/2, height/1.1, width/1.01, height/1.5);
      line(width/2, height/1.1, width-width/1.01, height/1.5);
  }
  
  void drawbit()
  {
    //println("Trys to draw");
    //Draws a part of the vizor
    //logic for this section:
    //line(startx,starty, map(guage, 0,1, startx,endx), map(guage, 0,1, starty,endy));
    //Lets the line be drawn gradualy
    switch (part)
    {
      case 1:
      {
        /*
        line(width/2, height/4, width/1.01, height/11);
        line(width/2, height/4, width-width/1.01, height/11);
        */
        
        guage += 1;
        line(width/2, height/4, map(guage, 0,10, width/2,width/1.01), map(guage, 0,10, height/4,height/11));
        line(width/2, height/4, map(guage, 0,10, width/2,width-width/1.01), map(guage, 0,10, height/4,height/11));
        
        if (guage == 10)
        {
          guage = 0;
          part = 2;
        }
        break;
      }
      case 2:
      {
        /*
        line(width/1.01, height/11, width/1.01, height/1.5);
        line(width-width/1.01, height/11, width-width/1.01, height/1.5);
        */
        
        guage += 1;
        line(width/1.01, height/11, map(guage, 0,10, width/1.01,width/1.01), map(guage, 0,10, height/11,height/1.5));
        line(width-width/1.01, height/11, map(guage, 0,10, width-width/1.01,width-width/1.01), map(guage, 0,10, height/11,height/1.5));
        
        if (guage == 10)
        {
          guage = 0;
          part = 3;
        }
        break;
      }
      case 3:
      {
        /*
        line(width/2, height/1.1, width/1.01, height/1.5);
        line(width/2, height/1.1, width-width/1.01, height/1.5);
        */
        
        guage += 1;
        line(width/1.01, height/1.5, map(guage, 0,10, width/1.01,width/2), map(guage, 0,10, height/1.5,height/1.1));
        line(width-width/1.01, height/1.5, map(guage, 0,10, width-width/1.01,width/2), map(guage, 0,10, height/1.5,height/1.1));
        
        if (guage == 10)
        {
          guage = 0;
          part = 4;
        }
        break;
      }
      case 4:
      {
        visorON = true;
        break;
      }
    }
  }
  
}