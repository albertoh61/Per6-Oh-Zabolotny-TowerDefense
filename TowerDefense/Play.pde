public class Play {
  ArrayList<ArrayList<Enemy>> levels = new ArrayList<ArrayList<Enemy>>();
  int lev = 1;
 
  public Play (Node<Actor> root) {
    levels.add(new ArrayList<Enemy>());
    for(int i = 0;i < 2;i ++){
      levels.get(0).add(new Dot(null)); //2 Dots
    }
    
    levels.add(new ArrayList<Enemy>());
    for(int i = 0;i < 3;i ++){
      levels.get(1).add(new Dot(null)); //3 Dots
    }
    
    levels.add(new ArrayList<Enemy>());
    //for(int i = 0;i < 6;i ++){
      levels.get(2).add(new Warrior(null)); //1 Warrior
    //}
    
    levels.add(new ArrayList<Enemy>());
    for(int i = 0;i < 3;i ++){
      levels.get(3).add(new Dot(null)); //1 Warrior, 3 Dots
    }
    levels.get(3).add(new Warrior(null));
    
    levels.add(new ArrayList<Enemy>());
    for(int i = 0;i < 5;i ++){
      levels.get(4).add(new Warrior(null)); //5 Warriors
    }
    
    levels.add(new ArrayList<Enemy>());
    for(int i = 0;i < 3;i ++){
      levels.get(5).add(new Knight(null)); //3 Knights
    }
    
    levels.add(new ArrayList<Enemy>());
    for(int i = 0;i < 5;i ++){
      levels.get(6).add(new Knight(null)); //5 Knights, 3 Warriors
    } 
    for(int i = 0;i < 3;i ++){
      levels.get(6).add(new Warrior(null));
    }
   
    levels.add(new ArrayList<Enemy>());
    for(int i = 0;i < 10;i ++){
      levels.get(7).add(new Knight(null)); //10 Knights, 10 Warriors, 10 Dots
    } 
    for(int i = 0;i < 10;i ++){
      levels.get(7).add(new Warrior(null));
    } 
    for(int i = 0;i < 10;i ++){
      levels.get(7).add(new Dot(null));
    }   
    
  }
  
  public int getLevel() {
   return lev; 
  }
  
  public ArrayList<ArrayList<Enemy>> getEnemies() {
   return levels;
  }
  
}

