public class Enemy extends Actor {
  int x, y, xpos, ypos, health, money, speed, size; // x and y are grid, xpos and ypos are pixel
  Node<Actor> n; // Size enemy takes up as a measure of the center to the farthest outer point.
  boolean nodeSet; // True if this has been given a Node, false otherwise.

  public Enemy() {
    n = null;
  }

  public Enemy(Node<Actor> root) {
    nodeSet = false;
    if (n != null) {
      n.setData(this);
      x = root.getX();
      y = root.getY();
      nodeSet = true;
    }
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
      
      if (nx > xpos - size && nx < xpos + size && ny > ypos - size && ny < ypos + size) {
        n.setData(null);
        n = n.getNext();
      }
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

  public void die() { // For enemies, die kills them or will cause you to lose a life
  }

  public void setNode(Node n) {
    this.n = n;
    nodeSet = true;
    x = n.getX();
    y = n.getY();
    xpos = x * 50;
    ypos = y * 50;
    n.setData(this);
  }

  public Node<Actor> getNode() {
    return n;
  }

  public boolean alive() {
    return health > 0;
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
  
  public int getSize() {
    return size;  
  }
  
  public boolean getNodeSet() {
    return nodeSet;
  }
}

