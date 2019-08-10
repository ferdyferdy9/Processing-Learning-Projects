class Node{
  Node left = null;
  Node right = null;
  
  int x, y;
  float purity;
  float el;
  float er;
  
  void set(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  Boolean check(Box b){
    return (b.get(x,y) == 1);
  }
}
