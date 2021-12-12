class Weapon {

  int shotTimer;
  int threshold;
  int projectileSpeed;
  int spread;

  //default weapon
  Weapon() {
    shotTimer = 0;
    threshold = 15;
    projectileSpeed = 5;
  }

  Weapon(int thr, int ps, int sp) {
    shotTimer = 0;
    threshold = thr;
    projectileSpeed = ps;
    spread = sp;
  }

  void update() {
    shotTimer++;
  }

  void fire() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX-p1.loc.x, mouseY-p1.loc.y);
      aimVector.setMag(projectileSpeed);
      OBJ.add(new Projectile(aimVector, yellow, 10));
      shotTimer = 0;
    }
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------
class Sniper extends Weapon {
  Sniper() {
    super (Sniper_thr, Sniper_PS, Sniper_SP);
  }
}

class MP5 extends Weapon {
  MP5() {
    super(MP5_thr, MP5_PS, MP5_SP);
  }
}
