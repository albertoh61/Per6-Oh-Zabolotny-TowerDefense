Grid g;
MyLinkedList L;
 
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
  g.setGrid();
  g.addEnemy(new Dot(L.getNode(0)));
  g.addTower(new Pew(15,9,2,1,2));
}
 
public void draw() {
  g.setGrid();
  ArrayList<Enemy> eA = g.geteA();
  ArrayList<Tower> tA = g.gettA();
  // Deals with drawing each enemy
  for (int i = 0;i < eA.size();i++) {
    if (eA.get(i).getNode() == null) {// This removes "dead" enemies, or enemies without a node
      eA.remove(i);
    } else {
      eA.get(i).draw();
      eA.get(i).move();
    }
  }
  // Deals with drawing each tower
  for (int i = 0;i < tA.size();i++) {
    tA.get(i).draw();  
  }
  // Fires each tower onto one enemy
  g.shoot();
  
  // Timing delay
  try {
    Thread.sleep(100);
  } catch(InterruptedException ex) {
    Thread.currentThread().interrupt();
  }
}
 
