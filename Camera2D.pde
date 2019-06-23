class Camera2D{
  float x;
  float y;
  float scale;
  
  Camera2D(){
    x = width/2;
    y = height/2;
    scale = 1;
  }
  
  void run(){
    translate(x,y);
    scale(scale);
  }
}
