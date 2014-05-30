public class Grid {
  color[][] gridc;
  Actor[][] grid;
  MyLinkedList path;
  
  public Grid(int x, int y) {
    gridc = new color[x / 50][y / 50];
    for (int i = 0;i < gridc.length;i++) {
      for (int j = 0;j < gridc[0].length;j++) {
        gridc[i][j] = color(random(155) + 100,random(155) + 100,0);
      }
    }
    grid = new Actor[x / 50][y / 50];
    path = new MyLinkedList();
  }

  public void setGrid() {
    for (int i = 0;i < gridc.length;i++) {
      for (int j = 0;j < gridc[0].length;j++) {
        fill(gridc[i][j]);
        rect(i * 50,j * 50,50,50);
      }
    }
  }

  public void set(int x, int y, color c) {
    gridc[x][y] = c;  
  }

  public MyLinkedList getPath() {
    return path;
  }  
  
}
