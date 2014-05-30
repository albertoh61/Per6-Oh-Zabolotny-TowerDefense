   public class Node<Actor> {
            private Actor name;
            private Node<Actor> next;
            private int x,y;
         
          public Node (int x1, int y1) {
              x = x1;
              y = y1;
              next = null;
          }
         
          public Node () {
           
          }
         
          public Node<Actor> getNext () {
              return next;
          }
         
          public Actor getData () {
              return name;
          }
         
          public int getX() {
           return x;
          }
         
          public int getY() {
           return y;
          }
         
          public void setData (Actor n) {
              this.name = n;
          }
         
          public void setNext (Node<Actor> next) {
              this.next = next;
          }
         
          public boolean hasNext() {
              return next != null;
          }
         
          public String toString () {
              return name.toString();
          }
         
            }


