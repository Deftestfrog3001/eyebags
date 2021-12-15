class Enemy extends GameObject {

  Enemy() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp  = 100;
    roomX = 7;
    roomY = 2;
    size = 50;
    xp = 2;
  }

  Enemy(int x, int y) {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp  = 100;
    roomX = x;
    roomY = y;
    size = 50;
    xp = 2;
  }

  Enemy(int _hp, int s, int x, int y, int exp) {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp  = _hp;
    roomX = x;
    roomY = y;
    size = s;
    xp = exp;
  }

  void show() {
    stroke(white);
    strokeWeight(5);
    fill(green);
    circle(loc.x, loc.y, size);
    fill(white);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();

    //bullet collision and taking damage
    int i = 0;
    while (i < OBJ.size()) {
      GameObject myOb = OBJ.get(i);
      if (myOb instanceof Projectile) {
        if (CollidingWith(myOb) && hp > 0) {
          myOb.hp--;
          hp=hp- (25 + p1.damage);
          if (hp <= 0) {
            println(myOb);
            OBJ.add(new Message(p1.roomX, p1.roomY, loc.x, loc.y, 180, xp, yellow));
            OBJ.add(new Loot(loc.x, loc.y, roomX, roomY));
            p1.xp += xp;
          }
        }
      }
      i++;
    }
  }
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
class NightStalker extends Enemy {

  NightStalker() {
    super(100, 50, 7, 3, 5);
  }

  NightStalker(int x, int y) {
    super(NightStalker_HP, NightStalker_SIZE, x, y, 5);
  }

  void show() {
    stroke(white);
    strokeWeight(5);
    fill(pink);
    circle(loc.x, loc.y, size);
    fill(white);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();

    //following AI
    vel = new PVector(p1.loc.x - loc.x, p1.loc.y - loc.y);
    vel.setMag(3);
  }
}
