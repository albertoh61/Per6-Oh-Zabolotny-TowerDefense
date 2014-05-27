Grid g;  
 
public void setup() {
   size(1350,800);
   g = new Grid(1350,800);
   g.setGrid();
   MyLinkedList L = g.getPath();
   for (int i = 0;i < 27;i++) {
      L.add(new Node(i,8));
   }  
}
 
public void draw() {
  Node n = L.getNode(0);
  while (n.hasNext()) {
    // Alter grid for path 
  }
  g.setGrid();
    
   
}
 
