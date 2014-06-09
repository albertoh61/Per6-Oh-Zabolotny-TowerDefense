Grid g;
MyLinkedList L;
Tower selected;
int lives = 10;
int money = 100;
char k;
int lev = 1;
int speed = 500;
int count; // Counts which enemy you are up to
PImage img,img2,img3;
String name,cost,dps,radius;
Play p;
int drawNum;

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
  p = new Play(L.getNode(0));
}

public void draw() {
  if(lev < 8) {
    g.setGrid();
    ArrayList<Enemy> eA = g.geteA();
    ArrayList<Tower> tA = g.gettA();
    ArrayList<Projectile> pA = g.getpA();
    // Deals with drawing each enemy
    if (L.getNode(0).getData() == null) {
      if (count < eA.size()) {
        eA.get(count).setNode(L.getNode(0));
        count++;
      }
    }
    for (int i = 0; i < eA.size (); i++) {
      if (eA.get(i).getNode() == null && eA.get(i).getNodeSet()) {// This removes "dead" enemies, or enemies without a node
        if (eA.get(i).alive())
          lives--;
        else
          money = money + eA.get(i).getMoney();
        eA.remove(i);
        count--;
      } else if (eA.get(i).getNodeSet()) {
        eA.get(i).draw();
        eA.get(i).move();
      }
      
    }
    // Deals with drawing each tower
    for (int i = 0; i < tA.size (); i++) {
      tA.get(i).draw();
      int x = tA.get(i).getX() * 50 + 25;
      int y = tA.get(i).getY() * 50 + 25;
      if (mouseX > x - 25 && mouseX < x + 25 &&
          mouseY > y - 25 && mouseY < y + 25  ) {// Creates radius circles around hovered towers
        stroke(0,0,0);
        strokeWeight(4);
        noFill();
        ellipseMode(RADIUS);
        ellipse(x,y,tA.get(i).getR() * 50,tA.get(i).getR() * 50);
        ellipseMode(CENTER);
        strokeWeight(1); 
      }
    }
  
    // Fires each tower onto one enemy
    g.shoot();
    for (int i = 0; i < pA.size(); i++) {
      pA.get(i).move();
      pA.get(i).draw();
      if (pA.get(i).done())
        pA.remove(i);
    }

    // Shows tower choices
    img = loadImage("Tower.jpeg");
    image(img,3,14 * 50 + 5);
    img2 = loadImage("rook.jpeg");
    image(img2,63,14 * 50 + 5);
    img3 = loadImage("sniper.jpeg");
    image(img3,123,14 * 50 + 5);
    

    // Displays how many lives you have remaining.
    fill(0, 0, 0);
    textSize(32);
    text("PLAY", 40, 32);
    text("Lives: " + lives, 10, 64);
    text("Money: " + money, 10, 96);
    text("Level: " + lev, 10, 128);
    
    //text("Speed: " + speed / 100, 10, 160);
    //text("Inc" , 10, 192);
    //text("Dec" , 80, 192);
    // Displays tower info
    text("1",15,14 * 50 - 10);
    text("2",80,14 * 50 - 10);
    text("3",140,14 * 50 - 10);
    text("Name: " + name,0,13 * 50 - 10);
    text("Cost: " + cost,300,13 * 50 - 10);
    text("DPS: " + dps,600,13 * 50 - 10);
    text("Radius: " + radius,900,13 * 50 - 10);
    if (mouseX > 0 && mouseX < 50 &&
      mouseY > 14 * 50) {
      name = "Cannons";
      cost = "$50";
      dps = "2"; // Because 1 shot per 60 frames at 60 frames per second is 1 shot of 2 damage per second, or 2 damage per second
      radius = "2"; // Tiles
    } else if (mouseX > 60 && mouseX < 110 && mouseY > 14 * 50)  {
      name = "Archers";
      cost = "$60";
      dps = "4";
      radius = "1";
    } else if (mouseX > 120 && mouseX < 170 && mouseY > 14 * 50) {
      name = "Snipers";
      cost = "$50";
      dps = "2";
      radius = "1";
    } else if (k == '1') {
      name = "Cannons";
      cost = "$50";
      dps = "2"; 
      radius = "2";
    } else if (k == '2') {
      name = "Archers";
      cost = "$60";
      dps = "4";
      radius = "1";
    } else if (k == '3') {
      name = "Snipers";
      cost = "$50";
      dps = "2";
      radius = "1";
    } else {
      name = "";
      cost = "";
      dps = "";
      radius = "";
    }
  }

  else {
      fill(0,0,0);
      textSize(32);
      text("GAME OVER, THANK YOU FOR PLAYING",400,400);
  }
}

public void mouseClicked() {
  /* Timing delay
  if(mouseX > 10 && mouseX < 50 && mouseY > 172 && mouseY < 212) {
    speed = speed - 100; }
  else if (mouseX > 80 && mouseX < 120 && mouseY > 172 && mouseY < 212) {
    speed = speed + 100; }
  
  if(speed <= 100 || speed > 1000)
    speed = 500;
    */
  ArrayList<Tower> tA = g.gettA();

  if (mouseX > 0 && mouseX < 50 &&
      mouseY > 14 * 50) {
    k = '1';
  }  
  
  if (money >= 50 && (mouseX > 260 || mouseY > 140) && mouseY < 12 * 50 && k == '1') {
    boolean occupied = false;
    for (int i = 0;i < tA.size();i++) {
      occupied = tA.get(i).getX() == mouseX / 50 && tA.get(i).getY() == mouseY / 50;  
    }
    if (!occupied) {
      g.addTower(new Pew(mouseX / 50, mouseY / 50, 2, 60, 3));
      money = money - 50;
    }
  }
  
  if (money >= 60 && (mouseX > 260 || mouseY > 140) && mouseY < 12 * 50 && k == '2') {
    boolean occupied = false;
    for (int i = 0;i < tA.size();i++) {
      occupied = tA.get(i).getX() == mouseX / 50 && tA.get(i).getY() == mouseY / 50;  
    }
    if (!occupied) {
      g.addTower(new Archer(mouseX / 50, mouseY / 50, 2, 30, 2));
      money = money - 60;
    }
  }
  
  if (money >= 50 && (mouseX > 260 || mouseY > 140) && mouseY < 12 * 50 && k == '3') {
    boolean occupied = false;
    for (int i = 0;i < tA.size();i++) {
      occupied = tA.get(i).getX() == mouseX / 50 && tA.get(i).getY() == mouseY / 50;  
    }
    if (!occupied) {
      g.addTower(new Sniper(mouseX / 50, mouseY / 50, 4, 120, 5));
      money = money - 50;
    }
  }
  
  if(mouseX > 40 && mouseX < 90 && mouseY > 12 && mouseY < 52 && g.geteA().size() == 0) {
      lev ++;
      count = 0;
      if (lev < 7) {
        for(int i = 0;i < lev;i ++){
          g.addEnemy(p.getEnemies().get(lev).get(i)); 
        }
      }
  }
}

public void keyPressed() {
  k = key;
}

