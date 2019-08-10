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
  
  PVector transMouse(float x, float y){
    x = (x- width/2)/scale +  width/2 - this.x;
    y = (y-height/2)/scale + height/2 - this.y;
    return new PVector(x,y);
  }
  
  void scrollMode(MouseEvent e){
    if(isPanKey)
      scale -= e.getCount()*0.1*scale;
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
      x += (mouseX-pmouseX)/scale;
      y += (mouseY-pmouseY)/scale;
    }
  }
  
  void update(){
    translate(width/2,height/2);
    scale(scale);
    translate(-width/2,-height/2);
    translate(x,y);
  }
}
