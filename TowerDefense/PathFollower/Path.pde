abstract class Path extends ArrayList<PVector>{
  float followRadius=10;
  
  void add(float x, float y){
    super.add(new PVector(x,y));
  }
}
