void setup()
{
  size(1000,800);
  logo = loadImage("Satan'sCat(Finished).png");
  eyes = loadImage("Eyes.png");
  opacity = 255;
  blink = 4;
  visorON = false; // to control the drawing of the vizor
  visor = new Visor();
  mode = 1;
  Difficulty = 2;
  
  //UI elements
  radar = new UIRadar(width/8,height-height/7.6,200,0.05f);
  Hbar = new UIHealth(width/1.8,height/10);
  tele = new UITeleport(width-width/8,height-height/7.6,200);
  ult = new UIUltimate(width/25,height/10);
  time = 6;
  
  //player based variables
  health = 100;
  score = 0;
  charge = 100;
  gun = new Gun();
}

//Main control variables
int mode;
int Difficulty;

//set up variables
PImage logo;
PImage eyes;
float opacity;
int blink;

boolean visorON;
Visor visor;

//UI elements
UIElement radar;
UIElement Hbar;
UIElement tele;
UIElement ult;
int time;

//Player based variables
int health;
int score;
int charge;
Gun gun;

//Array lists
ArrayList<Enemy> enemys = new ArrayList();
ArrayList<Bullet> bullets = new ArrayList();

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
      
      //spawn some enemys
      if(frameCount % 60 == 0)
      {
        SpawnEnemy();
        tele.update();
      }
      for(Enemy e:enemys)
      {
        e.render();
        e.update();
      }
      if(enemys.size() !=0)
      {
        CheckEnemys();
      }
      if(bullets.size() !=0)
      {
        CheckBullets();
      }
      gun.render();
      
      //Button presses
      if(keyPressed && frameCount % 5 ==0)
      {
        if(key == ' ')
        {
          gun.shoot();
        }
        if(key == 'e' && time == 6)
        {
          tele.use();
        }
        if(key == 'q' && charge == 100)
        {
          ult.use();
        }
      }
      
      for(Bullet b:bullets)
      {
        b.render();
        b.update();
      }
      fill(0);
      noStroke();
      triangle(0,height,width-width/1.01,height/1.5,width/1.45,height);
      triangle(width,height,width/1.01,height/1.5,width-width/1.45,height);
      visor.display();
      radar.render();
      radar.update();
      tele.render();
      Hbar.render();
      ult.render();
      
      if(frameCount % 1800 == 0)
      {
        Difficulty++;
      }
      if(health <= 0)
      {
        mode = 3;
      }
      break;
    }
    case 3:
    {
      //game over
      background(0);
      fill(255,0,0);
      stroke(255,0,0);
      textAlign(CENTER,CENTER);
      textSize(150);
      text("GAME OVER",width/2,height/4);
      textSize(90);
      text("Score: " + score,width/2,height/2.5);
      line(0,height/2,width, height/2);
      textSize(50);
      text("Press s to try again",width/2, height-height/2.5);
      if(keyPressed)
      {
        if(key == 's')
        {
          mode = 2;
          health = 100;
          score = 0;
          enemys.clear();
          bullets.clear();
        }
      }
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
  line(width/10,height-height/3.5,width-width/10, height-height/3.5); // top bar
  line(width/10,height/2.5,width-width/10, height/2.5); // bottom bar
  
  line(width/10,height/2.5, width/10,height-height/3.5); // left bar
  line(width-width/10, height-height/3.5, width-width/10, height/2.5); //right bar
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

void SpawnEnemy()
{
  //Spawn more big enemys as it gets harder
  int dice = (int) random(1,Difficulty);
  
  if(dice <2)
  {
    enemys.add(new Smalle(random(width/10,width-width/10),random(height/2.5, height-height/3.5), 50f,1));
  }
  else
  {
    
    enemys.add(new BigE(random(width/10,width-width/10),random(height/2.5, height-height/3.5), 500f,3));
  }
}



void CheckEnemys()
{
  for(int i = enemys.size()-1; i>=0; i--)
  {
    Enemy e = enemys.get(i);
    if(e.hits <= 0)
    {
      enemys.remove(i);
    }
    if(e.time == 0)
    {
      e.harm();
      enemys.remove(i);
    }
  }
}

void CheckBullets()
{
  for(int i = bullets.size()-1; i>=0; i--)
  {
    Bullet b = bullets.get(i);
    if(b.toDestroy == true || b.y < height/2.5)
    {
      bullets.remove(i);
    }
  }
}