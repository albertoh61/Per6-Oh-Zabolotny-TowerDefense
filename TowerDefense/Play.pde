public class Play {
  ArrayList<ArrayList<Enemy>> levels;
  Enemy eA;
  int lev = 1;
 
  public Play () {
   levels = new ArrayList<ArrayList<Enemy>>();
   eA = new Enemy();
  }
 
  public void createLevel(int lev) {
    for(int i = 0;i < lev;i ++) {
      levels.get(lev).add(eA);
    } 
    lev ++;
  }
 
  public void setLevel(int lev) {
    ArrayList<Enemy> enemies = levels.get(lev); 
  } 
  
  public int getLevel() {
   return lev; 
  }
  
}
