public class Sniper extends Tower {
  PImage img;

  public Sniper(int x, int y, int d, int fr, int r) {
    super(x, y, d, fr, r);
  }

  public void draw() {
     img = loadImage("sniper.png");
     image(img,x * 50 + 3,y * 50 + 5);
     // fill(color(255, 255, 255));
     // rect(x * 50 + 20, y * 50 + 20, 10, 10);
  } 
}
