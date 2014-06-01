 public class MyLinkedList<Actor> {
 
        private Node<Actor> head;
        private int length;
    
        public MyLinkedList() {
           head = new Node<Actor>();
        }
   
        public Node<Actor> getNode(int position) {
      if (position > length || position < -1) { //getNode has to include -1 to access head
          throw new IndexOutOfBoundsException();
      }
      if (position == -1)
          return head;
      Node<Actor> pos = head.getNext();
      for (int i = 0;i < position;i++) {
          pos = pos.getNext();
      }
      return pos;
        }
   
        public void add (int x,int y,int position) {
      Node<Actor> tmp = new Node<Actor>(x,y);
      if (position > length || position < 0) {
          throw new IndexOutOfBoundsException();
      }
      Node<Actor> pos = getNode(position - 1);
      tmp.setNext(pos.getNext());
      pos.setNext(tmp);
      length++;
        }
   
        public void set (int position,Actor a) {
      if (position > length || position < 0) {
          throw new IndexOutOfBoundsException();
      }
            getNode(position).setData(a);
        }
       
        public void remove (int position) {
      if (position > length || position < 0) {
          throw new IndexOutOfBoundsException();
      }
      getNode(position - 1).setNext(getNode(position - 1).getNext().getNext());
      length--;
        }
   
        public int find (String s) {
      for (int i = 0;i < this.length();i++) {
          if (getNode(i).getData().equals(s))
        return i;
      }
      return -1;
        }
   
        public int length() {
      return length;
        }
   
        public Actor get(int position) {
      if (position > length) {
          throw new IndexOutOfBoundsException();
      }
      return getNode(position).getData();
        }
   
        public String toString() {
      String s = "[" + head.getNext().getX() + head.getNext().getY();
      Node<Actor> pos = head.getNext().getNext();
      for (int i = 0;i < this.length() - 1;i++) {
          s = s + "," + pos.getX() + pos.getY();
          pos = pos.getNext();
      }
      s = s + "]";
      return s;
        }
  }

