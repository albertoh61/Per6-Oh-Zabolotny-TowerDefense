public class Grid {
  color[][] gridc;
  Actor[][] grid;
  //LinkedList path;
  
  public Grid(int x, int y) {
    gridc = new color[x / 50][y / 50];
    for (int i = 0;i < gridc.length;i++) {
      for (int j = 0;j < gridc[0].length;j++) {
        gridc[i][j] = color(random(255),random(255),0);
      }
    }
    grid = new Actor[x / 50][y / 50];
    //path = new LinkedList();
  }

  public void setGrid() {
    for (int i = 0;i < gridc.length;i++) {
      for (int j = 0;j < gridc[0].length;j++) {
        fill(gridc[i][j]);
        rect(i * 50,j * 50,50,50);
      }
    }
  }  
  
}
