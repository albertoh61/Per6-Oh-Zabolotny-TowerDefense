public class Dot extends Enemy {
  public Dot(Node<Actor> root) {
    super(root); 
  }
  
  public void draw() {
    fill(color(0,0,0));
    rect(x * 50 + 20,y * 50 + 20,10,10);
  }
  
  public void move() {
    super.move();
  }
  
  public void action() { // This removes Dot by drawing over it and removing its Node, effectively causing it to be removed at next run of draw().
    fill(color(240,230,140));
    stroke(color(240,230,140));
    rect(x * 50 + 19,y * 50 + 19,12,12);
    stroke(color(0,0,0));
    n.setData(null);
    n = null;       
  }
 
   
}
