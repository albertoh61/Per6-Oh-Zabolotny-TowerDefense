public class Dot extends Enemy {
  public Dot(Node root) {
    super(root); 
  }
  
  public void draw() {
    fill(color(255,255,255));
    rect(x * 50 + 24,y * 50 + 24,2,2);
  }
  
  public void move(int x, int y) {
    super.move(x,y);
  }
  
  public void action(int x, int y) {
    //if (n.getNext() == null)
   
    
  }
 
   
}
