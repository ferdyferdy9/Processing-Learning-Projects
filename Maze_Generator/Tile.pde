class Tile{
  int x, y;
  int size;
  
  Boolean up=false, right=false, down=false, left=false;
  
  Tile(int x, int y, int size){
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  void set(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void display(color c){
    pushMatrix();
    translate(x,y);
    
    noStroke();
    fill(c);
    rect(0,0,size,size);
    
    stroke(0);
    fill(0);
    
    point(     0,     0);
    point(     0,size-1);
    point(size-1,     0);
    point(size-1,size-1);
    
    if(!up)
      line(0,0,size-1,0);
    if(!right)
      line(size-1,0,size-1,size-1);
    if(!down)
      line(0,size-1,size-1,size-1);
    if(!left)
      line(0,0,0,size-1);
    
    popMatrix();
  }
}
