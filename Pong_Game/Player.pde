class Player{
  PVector pos = new PVector();
  PVector vel = new PVector();
  
  float w =  20;
  float h = 200;
  
  Player(float x, float y){
    pos.x = x;
    pos.y = y;
  }
  
  void update(){
    pos.add(vel);
  }
  
  Boolean apakahKenaBola(Bola b){
    if(
       (b.pos.x > pos.x && b.pos.x < pos.x + w) &&
       (b.pos.y > pos.y && b.pos.y < pos.y + h)
    ){
      return true;
    }
    return false;
  }
  
  void display(){
    rect(pos.x,pos.y, w, h);
  }
}
