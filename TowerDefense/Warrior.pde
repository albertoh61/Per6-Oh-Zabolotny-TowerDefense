public class Warrior extends Enemy {
  PImage img;
  
  public Warrior(Node<Actor> root) {
    super(root); 
    health = 10;
    money = 40;
    speed = 2;
    size = 5;
  }

  public void draw() {
    super.draw();
    img = loadImage("warrior.png");
    image(img, xpos, ypos);
    //fill(color(0, 0, 0));
    //rect(xpos + 20, ypos + 20, 10, 10);
  }

  public void move() {
    super.move();
  }

  public void die() { 
    fill(color(240, 230, 140));
    stroke(color(240, 230, 140));
    rect(x * 50 + 19, y * 50 + 19, 12, 12);
    stroke(color(0, 0, 0));
    n.setData(null);
    n = null;
  }
}

