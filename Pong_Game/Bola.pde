class Bola{
  PVector pos = new PVector();
  PVector vel = new PVector();
  
  Bola(float x, float y){
    pos.x = x;
    pos.y = y;
    
    vel.x = 4;
    vel.y = 2;
  }
  
  void update(){
    pos.add(vel);
  }
  
  void display(){
    ellipse(pos.x,pos.y,30,30);
  }
}
