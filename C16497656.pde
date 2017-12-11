void setup()
{
  size(1000,800);
  logo = loadImage("Satan'sCat(Finished).png");
  eyes = loadImage("Eyes.png");
  opacity = 255;
  blink = 4;
  visorON = false; // to control the drawing of the vizor
  visor = new Visor();
  mode = 2;
  
  //UI elements
  radar = new UIRadar(width/8,height-height/7.6,200,0.05f);
}

//Main control variable
int mode;

//set up variables
PImage logo;
PImage eyes;
float opacity;
int blink;

boolean visorON;
Visor visor;

//UI elements
UIElement radar;

//Player based variables



void draw()
{ 
  
  //Switch statement to swap between stages of the game.
  
  switch(mode)
  {
    case 1:
    {
      //set up
      
      //Fade out
      if (frameCount % 5 == 0 && opacity != -5)
      {
        background(20,0,20);
        fill(0,0,0, opacity);
        rect(0,0,width,height);
        
        fill(0,255,0, opacity);
        textAlign(CENTER,CENTER);
        textSize(50);
        text("Data Rush",width/2, height/7);
        
        tint(255, opacity);
        image(logo,width/11,height/20);
        
        text("By Satan's Cat", width/2, height/1.3);
        textSize(35);
        text("AKA: Enda Keane",width/2,height/1.15);
        text("AKA: C16497656",width/2,height/1.1);
        opacity-= 5;
      }
      
      //Draw visor
      if (opacity < 0)
      {
        
        stroke(0,255,0);
        if (visorON)
        {
          visor.display();
        }
        else
        {
          if(frameCount % 3 == 0)
          {
            visor.drawbit();
          }
        }
      }
      
      if (frameCount % 20 == 0 && visorON && blink >0)
      {
        if (blink % 2 == 0)
        {
          background(20,0,20);
          tint(255,255);
          eyes.resize(width,height);
          image(eyes,0,0);
          blink--;
        }
        else
        {
          background(20,0,20);
          blink--;
        }
      }
      
      
      /*stroke(0,255,0);
      line(width/2, height/4, width/1.01, height/11);
      line(width/2, height/4, width-width/1.01, height/11);
      
      line(width/1.01, height/11, width/1.01, height/1.5);
      line(width-width/1.01, height/11, width-width/1.01, height/1.5);
      
      line(width/2, height/1.1, width/1.01, height/1.5);
      line(width/2, height/1.1, width-width/1.01, height/1.5);*/
      //Load UI
      
      if(blink==0)
      {
        mode = 2;
      }
      
      break;
    }
    case 2:
    {
      //main game
      background(0);
      //println("Main game");
      drawBackground();
      visor.display();
      radar.render();
      radar.update();
      break;
    }
    case 3:
    {
      //game over
      
      break;
    }
  }
}


void drawBackground()
{
  float j = height/2.5;
  float change = 2;
  float dist = (width-width/10)-width/10;
  stroke(0,0,255);
  line(width/10,height-height/3.5,width-width/10, height-height/3.5);
  line(width/10,height/2.5,width-width/10, height/2.5);
  
  line(width/10,height/2.5, width/10,height-height/3.5);
  line(width-width/10, height-height/3.5, width-width/10, height/2.5);
  for(int i = 0; i< 20; i++)
  {
    line(width/10+(dist/20)*i,height/2.5, width/10+(dist/20)*i,height-height/3.5);
  }
  while(j<height-height/3.5)
  {
    line(width/10,j,width-width/10,j);
    j = j+change;
    change = change*1.25;
  }
  stroke(0,255,0);
}