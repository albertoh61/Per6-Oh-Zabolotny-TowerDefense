Grid g;
MyLinkedList L;
Tower selected;
int lives = 10;
int money = 100;
char k;
int level = 1;
int speed = 500;

public void setup() { 
  size(1350, 800);
  frameRate(60);
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
      level ++;
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
  text("PLAY", 40, 32);
  text("Lives: " + lives, 10, 64);
  text("Money: " + money, 10, 96);
  text("Level: " + level, 10, 128);
  text("Speed: " + speed / 100, 10, 160);
  text("Inc" , 10, 192);
  text("Dec" , 80, 192);
  
  /*
  try {
    Thread.sleep(speed);
  } 
  catch(InterruptedException ex) {
    Thread.currentThread().interrupt();
  }*/
}

public void mouseClicked() {
  // Timing delay
  if(mouseX > 10 && mouseX < 50 && mouseY > 140 && mouseX < 180) {
    speed = speed - 100; }
  else if (mouseX == 80 && mouseY == 160) {
    speed = speed + 100; }
  
  if(speed <= 100 || speed > 1000)
    speed = 500;
  
  if (money >= 50 && k == 'p') {
    g.addTower(new Pew(mouseX / 50, mouseY / 50, 2, 1, 3));
    money = money - 50;
  }
}

public void keyPressed() {
  k = key;
}

