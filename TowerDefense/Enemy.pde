public class Enemy extends Actor {
  int x,y;
  Node n;
  
  public Enemy(Node root) {
    x = root.getX();
    y = root.getY();
    n = root;
  }
  
  public void draw() {}
  
  public void move(int x, int y) {
    n = n.getNext();
    x = n.getX();
    y = n.getY();
  }
  
  public void action() {
    //if (n.getNext() == null)
   
    
  }
  
}
