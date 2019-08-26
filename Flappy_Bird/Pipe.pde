class Pipe extends PVector{
  PVector vel = new PVector(-2,0);
  float w,h;
  
  Pipe(float x, float y, float w, float h) {
    this.set(x,y);
    this.w = w;
    this.h = h;
  }
  
  void update(){
    this.add(vel);
  }
  
  void display(){
    fill(0,255,100);
    rect(x,y,w,h);
  }
}
