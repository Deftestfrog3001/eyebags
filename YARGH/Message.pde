class Message extends GameObject {

  int showTimer;
  int showLimit;
  int tint;

  Message(int roomx, int roomy, float x, float y, int L, int exp, int c) {
    loc = new PVector(x, y);
    hp  = 1;
    roomX = roomx;
    roomY = roomy;
    showTimer = 0;
    showLimit = L;
    xp = exp;
    tint = c; 
    println(xp);
  }

  void show() {
    fill(tint);
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
