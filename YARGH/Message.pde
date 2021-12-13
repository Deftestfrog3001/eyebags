class Message extends GameObject {

  int showTimer;
  int showLimit;

  Message(int roomx, int roomy, float x, float y, int L) {
    loc = new PVector(x, y);
    vel = new PVector(x, y + 5);
    hp  = 1;
    roomX = roomx;
    roomY = roomy;
    showTimer = 0;
    showLimit = L;
  }

  void show() {
    fill(yellow);
    textSize(50);
    text("+" + myEnemy.xp + "xp", myEnemy.loc.x, myEnemy.loc.y, 150, 100);
  }

  void act() {
    super.act();
    showTimer++;
    if (showTimer == showLimit) {
      hp = 0;
      showTimer = 0;
    }
  }
}
