class Camera2D{
  float x;
  float y;
  float scale;
  char panKey;
  char lastKey;
  Boolean isPanKey;
  
  Camera2D(){
    x = width/2;
    y = height/2;
    scale = 1;
    panKey = ' ';
    isPanKey = false;
  }
  
  void run(){
    input();
    update();
  }
  
  void input(){
    if(keyPressed){
      if(lastKey != key)
        if(key == panKey)
          isPanKey = !isPanKey;
      lastKey = key;
    } else {
      isPanKey = false;
      lastKey = 0;
    }
    
    if(isPanKey && mousePressed && mouseButton == LEFT){
      x += mouseX-pmouseX;
      y += mouseY-pmouseY;
    }
  }
  
  void update(){  
    translate(x,y);
    scale(scale);
  }
}
