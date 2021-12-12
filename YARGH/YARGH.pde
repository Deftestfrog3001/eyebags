//settings
//loot types
int AMMO = 0;
int DOSH = 1;
int WEAPON = 2;
int CONSUMABLE = 3;

//enemies
int NightStalker_HP = 50;
int NightStalker_SIZE = 50;

//weapons
int Sniper_thr = 100;
int Sniper_PS = 20;
int Sniper_SP = 0;

int MP5_thr = 1;
int MP5_PS = 8;
int MP5_SP = 25;

//sound
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//sound vari
Minim minim;
AudioPlayer intro;

//interactions
boolean Wkey, Skey, Akey, Dkey, Spacekey, Shiftkey, Pkey;
boolean mouseReleased;
boolean hadPressed;

//gifs
gif campfire;
gif manUp;
gif manDown;
gif manLeft;
gif manRight;

//fonts
PFont Pixel;

//images
PImage map;

color northRoom, eastRoom, southRoom, westRoom;

//textures
PImage cobble;

//color pallette
color red           = #FF0000;
color green         = #00FF00;
color blue          = #0000FF;
color black         = #000000;
color white         = #FFFFFF;
color grey          = #808080;
color pink          = #F76DDC;
color yellow        = #FFFF00;
color aqua          = #09B6E8;
color skyBlue       = #28E7ED;
color orangeGold    = #DAA520;
color purple        = #800080;

int mode;
final int INTRO=0;
final int GAME=1;
final int PAUSE=2;
final int WIN=3;
final int LOSS=4;

//buttons
Button StartB;
Button HP;
Button AGL;
Button DMG;
Button UnPause;

//Game objects
ArrayList<GameObject> OBJ;
ArrayList<DarkCell> DC;
Player p1;
Enemy myEnemy;
NightStalker myNightStalker;

//Darckcell size
int CellSize;

void setup() {
  HP  = new Button(">", width*0.1, height*0.3, 150, 100, red, white);
  AGL  = new Button(">", width*0.1, height*0.6, 150, 100, red, white);
  DMG  = new Button(">", width*0.1, height*0.9, 150, 100, red, white);
  frameRate(60);
  //fullScreen(FX2D);
  size(800, 600, FX2D);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  Pixel = createFont("alagard.ttf", 1);
  map = loadImage("map.png");

  //loadFonts
  textFont(Pixel);

  //loadGifs
  campfire = new gif(5, 7, "frame_", "_delay-0.1s.png");
  manUp = new gif(4, 10, "man/up/sprite_", ".png");
  manDown = new gif(4, 10, "man/down/sprite_", ".png");
  manLeft = new gif(4, 10, "man/left/sprite_", ".png");
  manRight = new gif(4, 10, "man/right/sprite_", ".png");

  p1 = new Player();
  myEnemy = new Enemy();
  myNightStalker = new NightStalker();


  //cell size
  CellSize = 3;

  //minim
  minim = new Minim(this);
  intro = minim.loadFile("Intro.mp3");

  //textures
  cobble = loadImage("cobble.png");

  //myObjects
  OBJ = new ArrayList<GameObject>();
  OBJ.add(p1);
  OBJ.add(myEnemy);
  OBJ.add(myNightStalker);

  //Create DarkGrid
  rectMode(CORNER);
  DC = new ArrayList<DarkCell>();
  float size = CellSize;
  int x = 0;
  int y = 0;

  while (x <= width) {
    DC.add(new DarkCell(x, y, size));

    x = x + CellSize;
    if (y - CellSize >= height) 
      break;

    if (x >= width) {
      y = y + CellSize; 
      x = 0;
    } 
    rectMode(CENTER);
  }

  //Stock Entities
  x = 0;
  y = 0;

  while (y < map.height) {
    color roomColor = map.get(x, y);
    //color = enemy

    //regular room
    if (roomColor == black) {
      OBJ.add(new Enemy(x, y));
    }

    //fight room
    if (roomColor == purple) {
      OBJ.add(new Enemy(x, y));

      OBJ.add(new NightStalker(x, y));
    }

    //recovery room
    if (roomColor == green) {
    }

    //tough room
    if (roomColor == yellow) {
    }

    //boss room
    if (roomColor == red) {
    }

    //start room
    if (roomColor == orangeGold) {
      //p1 = new Player(x,y);
    }

    //read map.png
    x++;
    if (x == map.width) {
      x = 0;
      y++;
    }
  }
}

void draw() {

  if (mousePressed) hadPressed = true;
  else if (hadPressed && !mousePressed) {
    mouseReleased = true;
    hadPressed = false;
  } else if (mouseReleased) mouseReleased = false;

  if (mode==INTRO) {
    intro();
  } else if (mode==GAME) {
    game();
  } else if (mode==PAUSE) {
    pause();
  } else if (mode==WIN) {
    win();
  } else if (mode==LOSS) {
    loss();
  }
}
