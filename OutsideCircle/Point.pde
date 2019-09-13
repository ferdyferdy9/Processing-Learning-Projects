class Point extends PVector{
  int size = 20;

  Point(){}
  Point(float x, float y){super(x,y);}
  
  void display(){
    ellipse(x,y,size,size);
  }
  
  Boolean intersect(PVector o){
    return this.dist(o) < 100;
  }
}
