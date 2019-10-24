class Game extends Scene{
  int y;
  
  Game(){
    
  }
  
  void update(){
    y++;
    if(y > height)
      y=0;
  }
  
  void draw(){
    ellipse(200,y,50,50);
    
  }
}
