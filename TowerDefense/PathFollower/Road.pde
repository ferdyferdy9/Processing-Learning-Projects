class Road extends Path{
  void display(){
    stroke(180);
    strokeWeight(20);
    
    int size = size()-1;
    for(int i=0; i<size; i++){
      line(get(i).x,get(i).y,get(i+1).x,get(i+1).y);
    }
    
    line(get(0).x,get(0).y,get(size).x,get(size).y);
  }
}
