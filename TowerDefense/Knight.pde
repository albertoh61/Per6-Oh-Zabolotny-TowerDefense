public class Knight extends Enemy {
  PImage img;
  
  public Knight(Node<Actor> root) {
    super(root); 
    health = 10;
    money = 70;
    speed = 4;
    size = 5;
  }

  public void draw() {
    super.draw();
    img = loadImage("knight.png");
    image(img, xpos, ypos);
    //fill(color(0, 0, 0));
    //rect(xpos + 20, ypos + 20, 10, 10);
  }

  public void move() {
    super.move();
  }

  public void die() { // This removes Dot by drawing over it and removing its Node, effectively causing it to be removed at next run of draw().
    fill(color(240, 230, 140));
    stroke(color(240, 230, 140));
    rect(x * 50 + 19, y * 50 + 19, 12, 12);
    stroke(color(0, 0, 0));
    n.setData(null);
    n = null;
  }
}

