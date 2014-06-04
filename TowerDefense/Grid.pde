public class Grid {
  color[][] gridc;
  Actor[][] grid;
  MyLinkedList path;
  ArrayList<Enemy> eA;
  ArrayList<Tower> tA;

  public Grid(int x, int y) {
    gridc = new color[x / 50][y / 50];
    for (int i = 0; i < gridc.length; i++) {
      for (int j = 0; j < gridc[0].length; j++) {
        gridc[i][j] = color(random(155) + 100, random(155) + 100, 0);
      }
    }
    grid = new Actor[x / 50][y / 50];
    path = new MyLinkedList();
    eA = new ArrayList<Enemy>();
    tA = new ArrayList<Tower>();
  }

  public void setGrid() {
    for (int i = 0; i < gridc.length; i++) {
      for (int j = 0; j < gridc[0].length; j++) {
        fill(gridc[i][j]);
        rect(i * 50, j * 50, 50, 50);
      }
    }
  }

  public void set(int x, int y, color c) {
    gridc[x][y] = c;
  }

  public void shoot() { // Makes all towers shoot the closest enemy to them, if it is within their range
    double temp = 0;
    int x, y;
    double d = Integer.MAX_VALUE;
    Enemy target = null;
    for (int i = 0; i < tA.size (); i++) {
      for (int j = 0; j < eA.size (); j++) {
        if (eA.get(j).getNode() != null) {
          x = eA.get(j).getNode().getX() - tA.get(i).getX();
          y = eA.get(j).getNode().getY() - tA.get(i).getY();
          temp = Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2)); // Distance from enemy to tower
          if (temp < d) {
            d = temp;
            target = eA.get(j);
          }
        }
      }
      if (d <= tA.get(i).getR() && frameCount % (60 / tA.get(i).getFr()) == 0)
        tA.get(i).shoot(target);
      target = null;
    }
  }

  public MyLinkedList getPath() {
    return path;
  } 

  public void addEnemy(Enemy e) {
    eA.add(e);
  }

  public void addTower(Tower t) {
    tA.add(t);
  }

  public ArrayList<Enemy> geteA() {
    return eA;
  } 

  public ArrayList<Tower> gettA() {
    return tA;
  }
}

