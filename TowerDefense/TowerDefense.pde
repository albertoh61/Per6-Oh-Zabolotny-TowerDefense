Grid g;
MyLinkedList L;
ArrayList<Enemy> eA;
 
public void setup() { 
  size(1350,800);
  //Creates grid of colors
  g = new Grid(1350,800);
  //Creates path that correlates to LinkedList
  L = g.getPath();
  for (int i = 0;i < 27;i++) {
     L.add(i,8,0);
  }
  Node n = L.getNode(0);
  while (n != null) {
    g.set(n.getX(), n.getY(), color(240,230,140));
    n = n.getNext();
  }
  eA = new ArrayList<Enemy>();
  g.setGrid();
  addEnemy(new Dot(L.getNode(0)));
}
 
public void draw() {
  g.setGrid();
  // Deals with drawing each enemy
  for (int i = 0;i < eA.size();i++) {
    if (eA.get(i).getNode() == null) // This removes "dead" enemies, or enemies without a node
      eA.remove(i);
    else {
      eA.get(i).draw();
      eA.get(i).move();
    }
  }
  // Timing delay
  try {
    Thread.sleep(100);
  } catch(InterruptedException ex) {
    Thread.currentThread().interrupt();
  }
}

public void addEnemy(Enemy e) {
  eA.add(e);
}
 
