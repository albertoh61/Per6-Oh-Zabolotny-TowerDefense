public class Tower extends Actor {
  int x,y;
  int d,fr,r; //Damage, Fire Rate, Radius

  public Tower(int x,int y,int d,int fr,int r) {
    this.x = x;
    this.y = y;
    this.d = d;
    this.fr = fr;
    this.r = r;
  }

  public void draw() {}

  public void move() {}

  public void shoot(Enemy e) {
    if (e != null)
      e.loseHealth(d);
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
  
}
