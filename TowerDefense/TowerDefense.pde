public class TowerDefense {
  Grid g;  
  
 public TowerDefense() {
 }
 
 public setup() {
   size(1350,800);
   g = new Grid(1350,800);
   g.setGrid();   
 }
  
}
