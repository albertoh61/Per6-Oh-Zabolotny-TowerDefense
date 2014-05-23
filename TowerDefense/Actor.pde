public abstract class Actor {
  int x,y;
  Node n;
  
  public abstract void draw();
  
  public abstract void move(int x, int y);
  
  public abstract void action(int x, int y);
}
