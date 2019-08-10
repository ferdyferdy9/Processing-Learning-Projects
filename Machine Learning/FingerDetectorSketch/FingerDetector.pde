class FingerDetector{
  BoxBuilder bb;
  DecisionTree dTree;
  
  FingerDetector(String dna){
    String[] list = splitTokens(dna, " ,()" );
    ArrayList<Float> data = new ArrayList<Float>();
    
    for(String s : list){
      data.add(float(s));
    }
    
    dTree = new DecisionTree(data,3);
    bb = new BoxBuilder();
  }
  
  void markFingers(IPCapture cam){
    cam.loadPixels();
    bb.setImg(translateImage(cam));
    
    for(int y=24; y < cam.height-24; y++){
      for(int x=24; x < cam.width-24; x++){
        Box b = bb.createSample(x,y);
        
        if(b == null)
          continue;
        
        int loc = x + y*cam.width;
        if(dTree.decide(b)){
          cam.pixels[loc] = color(0,0,255);
        }
      }
    }
    
    cam.updatePixels();
  }
  
  PImage translateImage(PImage img){
    PImage result = createImage(img.width, img.height, RGB);
    result.loadPixels();
    img.loadPixels();
  
    int loc = 0;
    for (int y = 0; y < img.height; y++) {
      for (int x = 0; x < img.width; x++) {
        // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
        float r = red(img.pixels[loc]);
        float g = green(img.pixels[loc]);
        float b = blue(img.pixels[loc]);
        
        if((r+g+b)/3 < 120)
          result.pixels[loc] = color(0);
        else
          result.pixels[loc] = color(255);
        
        loc++;
      }
    }
    result.updatePixels();
    return result;
  }
}
