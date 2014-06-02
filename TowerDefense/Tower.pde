public class Tower extends Actor {
  int x,y;
  int d,fr,r; //Damage, Fire Rate, Radius

  public void draw() {}

  public void move() {}

  public void action(Enemy e) {
    e.loseHealth(d);
  }  
  
  public void getFr() {
    return fr; 
  }
  
  public void getR() {
    return r;  
  }
  
}
