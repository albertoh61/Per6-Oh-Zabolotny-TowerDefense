public class Enemy extends Actor {
  int x,y,health;
  Node<Actor> n;
  
  public Enemy() {
    n = null; 
  }
  
  public Enemy(Node<Actor> root) {
    x = root.getX();
    y = root.getY();
    n = root;
  }
  
  public void draw() {}
  
  public void move() {
    if (n.getNext() == null || health <= 0)
      die();
    else {
      n.setData(null);
      n.getNext().setData(this);
      n = n.getNext();
      x = n.getX();
      y = n.getY();
    }
  }
  
  public void loseHealth(int x) {
    health = health - x;  
  }
  
  public void die() { // For enemies, die kills them and will, in the future, cause you to lose a life
  }
  
  public Node<Actor> getNode() {
    return n; 
  }
}
