class BoxFactory{
  PImage img;
  
  BoxFactory(PImage img){
    this.img = img;
  }
  
  void setImg(PImage img){
    this.img = img;
  }
  
  Box[][] createSample(){
    img.loadPixels();
    
    int w = img.width;
    int h = img.height;
    int r = 24;
    
    Box[][] boxes = new Box[h-r*2][w-r*2];
    
    for(int y=0; y < h-r*2; y++){
      for(int x=0; x < w-r*2; x++){
        int loc = x+r + (y+r)*w;
        boxes[y][x] = new Box(9);
        
        for(int b=0; b<=r*2; b+=6){
          for(int a=0; a<=r*2; a+=6){
            int loc2 = loc + (a-r) + (b-r)*w;
            int g = (int) green(img.pixels[loc2]);
            
            boxes[y][x].set(a/6, b/6, g);
          }
        }
      }
    }
    img.updatePixels();
    
    return boxes;
  }
  
  Box createSample(int x, int y){
    img.loadPixels();
    
    int w = img.width;
    int h = img.height;
    int r = 24;
    
    int loc = x + y*w;
    Box box = new Box(9);
    
    for(int b=0; b<=r*2; b+=6){
      for(int a=0; a<=r*2; a+=6){
        int loc2 = loc + (a-r) + (b-r)*w;
        int g = (int) green(img.pixels[loc2]);
        
        box.set(a/6, b/6, g);
      }
    }
    
    img.updatePixels();
    
    return box;
  }
  
  Box createAnswer(){
    // TODO
    return null;
  }
}
