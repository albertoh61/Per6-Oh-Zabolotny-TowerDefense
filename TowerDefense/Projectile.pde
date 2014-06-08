public class Projectile extends Actor {
  Enemy e; // Target
  //double direction; // angle to target
  //double d; // distance to target
  //double dcovered; // distance traveled
  int speed; 
  int xpos,ypos; 
  int damage;
 
  public Projectile(Enemy e,int x1,int y1,int s,int dam) {
    xpos = x1 * 50;
    ypos = y1 * 50;
    speed = s;
    this.e = e;
    damage = dam;
    /* Idea of projectile moving to predicted target location scrapped - too complicated and buggy

    int s = e.getSpeed();
    int expos = e.getXPos();
    int eypos = e.getYPos();
    d = Math.sqrt(Math.pow(expos - xpos,2) + Math.pow(eypos - ypos,2));
    double direction = Math.toDegrees(Math.atan((eypos - ypos)/(expos - xpos))); 
    if (direction < 0)
      direction = direction * -1; 
    System.out.println(direction);     
    double pd = 0;
    double ed = d;
    System.out.println(d);
    int ticks = 1;
    while (!(pd > ed - e.getSize() && pd < ed + e.getSize())) {
      ed = ticks * s;
      pd = Math.sqrt(Math.pow(d,2) + Math.pow(ed,2) - 2 * d * ed * Math.cos(theta));
      ticks++;
    }
    time = ticks;
    int pexpos = expos + (int)ed;
    int peypos = eypos;
    double theta2 = Math.toDegrees(Math.atan((peypos - ypos)/(pexpos - xpos))); 
    if (theta2 < 0)
      theta2 = theta2 * -1;
    direction = 180 - theta - theta2;  
    System.out.println(direction);
    System.out.println(pd);
    System.out.println(ed + "\n");
    d = pd;    
    */
  }
  
  public void draw() {
    fill(color(0, 0, 0));
    rect(xpos + 22, ypos + 22, 5, 5);  
  }
  
  public void move() {
    for (int i = 0;i < speed;i++) {
      if (e.getXPos() > xpos)    
        xpos++;
      if (e.getXPos() < xpos)
        xpos--;
      if (e.getYPos() > ypos)
        ypos++;
      if (e.getYPos() < ypos)
        ypos--;
    }
    /*
    double xdis = (d * Math.cos(direction) / time);
    double ydis = (d * Math.sin(direction) / time);
    xpos = xpos + (int)xdis;
    ypos = ypos + (int)ydis;
    dcovered = dcovered + Math.sqrt(Math.pow(xdis,2) + Math.pow(ydis,2));   
    */
  }
  
  public boolean done() {
    if (Math.abs(e.getXPos() - xpos) < e.getSize() && Math.abs(e.getYPos() - ypos) < e.getSize()) {
      e.loseHealth(damage);
      return true;
    }
    return false;  
  }
  
}
