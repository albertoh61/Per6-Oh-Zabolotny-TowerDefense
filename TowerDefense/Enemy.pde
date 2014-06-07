public class Enemy extends Actor {
  int x, y, xpos, ypos, health, money, speed; // x and y are grid, xpos and ypos are pixel
  Node<Actor> n;

  public Enemy() {
    n = null;
  }

  public Enemy(Node<Actor> root) {
    x = root.getX();
    y = root.getY();
    xpos = x * 50;
    ypos = y * 50;
    n = root;
    speed = 1;
  }

  public void draw() {
    fill(0, 0, 0);
    textSize(10);
    text("" + health, xpos + 40, ypos + 45);
  }

  public void move() {
    if (n.getNext() == null || health <= 0)
      die();
    else { 
      int nx = n.getNext().getX() * 50;
      int ny = n.getNext().getY() * 50;
      
      if (nx > xpos)
        xpos = xpos + speed;
      if (ny > ypos)
        ypos = ypos + speed;
      if (nx < xpos)
        xpos = xpos - speed;
      if (ny < ypos)
        ypos = ypos - speed;
      
      if (nx == xpos && ny == ypos)
        n = n.getNext();
    }
    /*
    if (n.getNext() == null || health <= 0)
      die();
    else {
      n.setData(null);
      n.getNext().setData(this);
      n = n.getNext();
      x = n.getX();
      y = n.getY();
    }*/
  }

  public void loseHealth(int x) {
    health = health - x;
  }

  public void die() { // For enemies, die kills them and will, in the future, cause you to lose a life
  }

  public Node<Actor> getNode() {
    return n;
  }

  public boolean alive() {
    return health >= 0;
  }

  public int getMoney() {
    return money;
  }
  
  public int getSpeed() {
    return speed;  
  }
  
  public int getXPos() {
    return xpos;  
  }
  
  public int getYPos() {
    return ypos;  
  }
}

