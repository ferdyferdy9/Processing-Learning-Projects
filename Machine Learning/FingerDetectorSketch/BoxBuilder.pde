class BoxBuilder{
  PImage img;
  int w, h;
  int r = 24;
  
  void setImg(PImage img){
    this.img = img;
    w = img.width;
    h = img.height;
  }
  
  void addSamplesto(ArrayList<Box> boxes){
    for(int y=r; y < h-r; y++){
      for(int x=r; x < w-r; x++){
        boxes.add(createSample(x, y));
      }
    }
  }
  
  Box createSample(int x, int y){
    if(!img.isLoaded())
      img.loadPixels();
    
    int loc = x + y*w;
    
    Box box = new Box(17);
    
    if(green(img.pixels[loc]) == 0)
      return null;
    
    int red = (int) red(img.pixels[loc]);
    int grn = (int) green(img.pixels[loc]);
    
    box.value = red == 0 && grn != 0;
    
    for(int y2=0; y2<=r*2; y2+=3){ //<>//
      for(int x2=0; x2<=r*2; x2+=3){
        int loc2 = loc + (x2-r) + (y2-r)*w;
        box.set(x2/3, y2/3, (int) green(img.pixels[loc2]));
      }
    }
    
    return box;
  }
}
