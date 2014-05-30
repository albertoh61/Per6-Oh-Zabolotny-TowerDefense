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
}
 
public void draw() {
    
   
}
 
