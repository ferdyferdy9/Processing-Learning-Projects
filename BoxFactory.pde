class BoxFactory{
  PImage img;
  int w, h;
  int r = 24;
  
  void setImg(PImage img){
    this.img = img;
    w = img.width;
    h = img.height;
  }
  
  ArrayList<Box> createSamples(){
    ArrayList<Box> boxes = new ArrayList<Box>();
    
    for(int y=r; y < h-r*2; y++){
      for(int x=r; x < w-r*2; x++){
        Box b = createSample(x, y);
        
        if(b == null)
          continue;
        
        boxes.add(b);
      }
    }
    
    return boxes;
  }
  
  Box createSample(int x, int y){
    if(!img.isLoaded())
      img.loadPixels();
    
    int loc = x + y*w;
    
    // if it has no value
    if(green(img.pixels[loc]) == 0)
      return null;
    
    Box box = new Box(9);
    
    for(int b=0; b<=r*2; b+=6){
      for(int a=0; a<=r*2; a+=6){
        int loc2 = loc + (a-r) + (b-r)*w;
        int g = (int) green(img.pixels[loc2]);
        
        box.set(a/6, b/6, g);
      }
    }
    
    return box;
  }
  
  Box createAnswer(){
    // TODO
    return null;
  }
}
