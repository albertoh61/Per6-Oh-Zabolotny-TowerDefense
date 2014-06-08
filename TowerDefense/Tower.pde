public class Tower extends Actor {
  int x, y;
  int d, fr, r; // Damage, Fire Rate, Radius
  int count;

  public Tower(int x, int y, int d, int fr, int r) {
    this.x = x;
    this.y = y;
    this.d = d;
    this.fr = fr;
    this.r = r;
    count = fr;
  }

  public void draw() {
  }

  public void move() {
  }

  public Projectile shoot(Enemy e) {
    if (e != null) {
      if (count == fr) { // Takes into account firerate of tower, shoots once every fr frames
        Projectile p = new Projectile(e,x,y,5,d);
        count = 0;
        return p;
      }
      count++;
    }
    else
      count = fr; // This ensures that the first shot is fired without delay
    return null;
  }  

  public int getFr() {
    return fr;
  }

  public int getR() {
    return r;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public void setCoords(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

