public class Projectile extends Actor {
  Enemy target;
  int direction; // angle to target
  int d; // distance to target
 
  public Projectile(Enemy e) {
    int s = e.getSpeed();
    int expos = e.getXPos();
    int eypos = e.getYPos();
    d = Math.sqrt(Math.pow(expos - x * 50,2) + Math.pow(eypos - y * 50,2));
    int pd = 0;
    int ed = d;
    int count = 0;
    while (pd != ed) {
      ed = Math.sqrt(Math.pow((expos + count) - x * 50,2) + Math.pow((eypos + count) - y * 50,2));
      pd = count
    }
  }
  
  public draw() {
    fill(color(0, 0, 0));
    rect(x * 50 + 22, y * 50 + 22, 5, 5);  
  }
  
  public move() {
    
  }
  
}
