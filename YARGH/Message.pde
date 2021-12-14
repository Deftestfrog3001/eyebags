class Message extends GameObject {

  int showTimer;
  int showLimit;

  Message(int roomx, int roomy, float x, float y, int L, int exp) {
    loc = new PVector(x, y);
    hp  = 1;
    roomX = roomx;
    roomY = roomy;
    showTimer = 0;
    showLimit = L;
    xp = exp;
    println(xp);
  }

  void show() {
    fill(yellow);
    textSize(25);
    text("+" + xp + "xp", loc.x, loc.y, 150, 100);
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
