public class Play {
  ArrayList<ArrayList<Enemy>> levels = new ArrayList<ArrayList<Enemy>>();
  int lev = 1;
 
  public Play (Node<Actor> root) {
    levels.add(new ArrayList<Enemy>());
    for(int i = 0;i < 4;i ++){
      levels.get(0).add(new Dot(null));
    }
    levels.add(new ArrayList<Enemy>());
    for(int i = 0;i < 5;i ++){
      levels.get(1).add(new Dot(null));
    }
    levels.add(new ArrayList<Enemy>());
    for(int i = 0;i < 6;i ++){
      levels.get(2).add(new Dot(null));
    }
    levels.add(new ArrayList<Enemy>());
    for(int i = 0;i < 7;i ++){
      levels.get(3).add(new Dot(null));
    }
    levels.add(new ArrayList<Enemy>());
    for(int i = 0;i < 8;i ++){
      levels.get(4).add(new Dot(null));
    }
    levels.add(new ArrayList<Enemy>());
    for(int i = 0;i < 9;i ++){
      levels.get(5).add(new Dot(null));
    }
    levels.add(new ArrayList<Enemy>());
    for(int i = 0;i < 10;i ++){
      levels.get(6).add(new Dot(null));
    }  
    
  }
  
  public int getLevel() {
   return lev; 
  }
  
  public ArrayList<ArrayList<Enemy>> getEnemies() {
   return levels;
  }
  
}

