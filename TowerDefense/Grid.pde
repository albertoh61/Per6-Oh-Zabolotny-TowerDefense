public class Grid {
  color[][] gridc;
  
  public Grid(int x, int y) {
    gridc = new gridc[x / 50][y / 50];
    for (int i = 0;i < gridc.length;i++) {
      for (int j = 0;j < gridc[0].length;j++) {
        gridc[i][j] = new color(random(255),random(255),random(255));
      }
    }
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
