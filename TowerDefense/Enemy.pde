public class Enemy extends Actor {
  int x,y;
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
    if (n.getNext() == null)
      action();
    else {
      n.setData(null);
      n.getNext().setData(this);
      n = n.getNext();
      x = n.getX();
      y = n.getY();
    }
  }
  
  public void action() { // For enemies, action kills them and will, in the future, cause you to lose a life
  }
  
  public Node<Actor> getNode() {
    return n; 
  }
}
