Grid g;
MyLinkedList L;
Tower selected;
int lives = 10;
int money = 100;
char k;

public void setup() { 
  size(1350, 800);
  //Creates grid of colors
  g = new Grid(1350, 800);
  //Creates path that correlates to LinkedList
  L = g.getPath();
  for (int i = 0; i < 27; i++) {
    L.add(i, 8, 0);
  }
  Node n = L.getNode(0);
  while (n != null) {
    g.set(n.getX(), n.getY(), color(240, 230, 140));
    n = n.getNext();
  }
  g.setGrid();
  g.addEnemy(new Dot(L.getNode(0)));
}

public void draw() {
  g.setGrid();
  ArrayList<Enemy> eA = g.geteA();
  ArrayList<Tower> tA = g.gettA();
  // Deals with drawing each enemy
  for (int i = 0; i < eA.size (); i++) {
    if (eA.get(i).getNode() == null) {// This removes "dead" enemies, or enemies without a node
      if (eA.get(i).alive())
        lives--;
      else
        money = money + eA.get(i).getMoney();
      eA.remove(i);
    } else {
      eA.get(i).draw();
      eA.get(i).move();
    }
  }
  // Deals with drawing each tower
  for (int i = 0; i < tA.size (); i++) {
    tA.get(i).draw();
  }
  // Fires each tower onto one enemy
  g.shoot();

  // Displays how many lives you have remaining.
  fill(0, 0, 0);
  textSize(32);
  text("Lives: " + lives, 10, 32);
  text("Money: " + money, 10, 64);

  // Timing delay
  try {
    Thread.sleep(500);
  } 
  catch(InterruptedException ex) {
    Thread.currentThread().interrupt();
  }
}

public void mouseClicked() {
  if (money >= 50 && k == 'p') {
    g.addTower(new Pew(mouseX / 50, mouseY / 50, 2, 1, 2));
    money = money - 50;
  }
}

public void keyPressed() {
  k = key;
}

