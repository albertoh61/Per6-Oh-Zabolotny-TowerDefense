public class Pew extends Tower {
  PImage img;

  public Pew(int x, int y, int d, int fr, int r) {
    super(x, y, d, fr, r);
  }

  public void draw() {
    img = loadImage("Tower.png");
    image(img,mouseX/50,mouseY/50);
   // fill(color(255, 255, 255));
   // rect(x * 50 + 20, y * 50 + 20, 10, 10);
  }
}

