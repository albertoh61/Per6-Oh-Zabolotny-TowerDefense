 public class MyLinkedList<T> {
        public class Node<T> {
        private T name;
        private Node<T> next;
      
      public Node (T n) {
          this.name = n;
          next = null;
      }
      
      public Node<T> getNext () {
          return next;
      }
      
      public T getData () {
          return name;
      }
      
      public void setData (T n) {
          this.name = n;
      }
      
      public void setNext (Node<T> next) {
          this.next = next;
      }
      
      public String toString () {
          return name.toString();
      }
      
        }
        private Node<T> head;
        private int length;
    
        public MyLinkedList() {
      head = new Node<T>(null);
        }
    
        public Node<T> getNode(int position) {
      if (position > length || position < -1) { //getNode has to include -1 to access head
          throw new IndexOutOfBoundsException();
      }
      if (position == -1)
          return head;
      Node<T> pos = head.getNext();
      for (int i = 0;i < position;i++) {
          pos = pos.getNext();
      }
      return pos;
        }
    
        public void add (T s,int position) {
      Node<T> tmp = new Node<T>(s);
      if (position > length || position < 0) {
          throw new IndexOutOfBoundsException();
      }
      Node<T> pos = getNode(position - 1);
      tmp.setNext(pos.getNext());
      pos.setNext(tmp);
      length++;
        }
    
        public void set (int position,T newString) {
      if (position > length || position < 0) {
          throw new IndexOutOfBoundsException();
      }
            getNode(position).setData(newString);
        }
        
        public void remove (int position) {
      if (position > length || position < 0) {
          throw new IndexOutOfBoundsException();
      }
      getNode(position - 1).setNext(getNode(position - 1).getNext().getNext());
      length--;
        }
    
        public int find (T s) {
      for (int i = 0;i < this.length();i++) {
          if (getNode(i).getData().equals(s))
        return i;
      }
      return -1;
        }
    
        public int length() {
      return length;
        }
    
        public T get(int position) {
      if (position > length) {
          throw new IndexOutOfBoundsException();
      }
      return getNode(position).getData();
        }
    
        public String toString() {
      String s = "[" + head.getNext().getData();
      Node<T> pos = head.getNext().getNext();
      for (int i = 0;i < this.length() - 1;i++) {
          s = s + "," + pos.getData();
          pos = pos.getNext();
      }
      s = s + "]";
      return s;
        }
  }
