PImage img;

void setup() {
  size(180,320);
  img = loadImage("data1.png");
}

void draw() {
  loadPixels();
  
  // Since we are going to access the image's pixels too  
  img.loadPixels(); 
  
  int loc = 0;
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if(x >= img.width || y >= img.height)
        break;
      
      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      
      int sLoc = x + y*width;
      if((r+g+b)/3 < 120)
        pixels[sLoc] = color(0);
      else
        pixels[sLoc] = color(255);
      
      loc++;
    }
  }
  updatePixels();
  
  stroke(255,0,0);
  noFill();
  rectMode(CENTER);
  rect(mouseX, mouseY, 51, 51);
}

void keyPressed(){
  if(key == 'c')
    save("output.png");
}
