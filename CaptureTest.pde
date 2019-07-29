import ipcapture.*;

IPCapture cam;
Boolean isFlashMode = false;
Boolean isBWMode = false;

void setup() {
  size(640,480);
  cam = new IPCapture(this, "http://192.168.1.243:8080/video", "", "");
  cam.start();
  
  // this works as well:
  
  // cam = new IPCapture(this);
  // cam.start("url", "username", "password");
  
  // It is possible to change the MJPEG stream by calling stop()
  // on a running camera, and then start() it with the new
  // url, username and password.
}

void draw() {
  if (cam.isAvailable()) {
    cam.read();
    
    loadPixels();
    cam.loadPixels();
    for (int x = 0; x < cam.width; x++) {    
      for (int y = 0; y < cam.height; y++) {   
        int loc = x + y * cam.width;
        
        float r = red  (cam.pixels[loc]);      
        float g = green(cam.pixels[loc]);      
        float b = blue (cam.pixels[loc]);
        
        color c = color(r, g, b);      
        pixels[loc] = c;   
      }
    }
    
    if(isBWMode)
      BWMode();
    if(isFlashMode)
      flashMode();
      
    updatePixels();
  }
}

void keyPressed() {
  if (key == ' ') {
    if (cam.isAlive()) cam.stop();
    else cam.start();
  }
  if (key == 'f') {
    isFlashMode = !isFlashMode;
  }
  if (key == 'b') {
    isBWMode = !isBWMode;
  }
  if (key == 's') {
    save("data.png");
  }
}

void flashMode(){
  for (int x = 0; x < cam.width; x++) {    
    for (int y = 0; y < cam.height; y++) {      
      // Calculate the 1D location from a 2D grid
      int loc = x + y * cam.width;      
    
      // Get the red, green, blue values from a pixel      
      float r = red  (pixels[loc]);      
      float g = green(pixels[loc]);      
      float b = blue (pixels[loc]);      
      
      // Calculate an amount to change brightness based on proximity to the mouse      
      float d = dist(x, y, mouseX, mouseY);      
      float adjustbrightness = map(d, 0, 150, 4, 0);      
      r *= adjustbrightness;      
      g *= adjustbrightness;      
      b *= adjustbrightness;      
      
      // Constrain RGB to make sure they are within 0-255 color range      
      r = constrain(r, 0, 255);      
      g = constrain(g, 0, 255);      
      b = constrain(b, 0, 255);      
    
      // Make a new color and set pixel in the window      
      color c = color(r, g, b);      
      pixels[loc] = c;    
    }  
  }
}

void BWMode(){
  for (int x = 0; x < cam.width; x++) {    
    for (int y = 0; y < cam.height; y++) {      
      // Calculate the 1D location from a 2D grid
      int loc = x + y * cam.width;      
    
      // Get the red, green, blue values from a pixel      
      float r = red  (pixels[loc]);      
      float g = green(pixels[loc]);      
      float b = blue (pixels[loc]);   
      
      // convert to black and white
      float bw = (r+g+b)/3;
      
      // assign the new rgb
      r = bw;
      g = bw;
      b = bw;
    
      // Make a new color and set pixel in the window      
      color c = color(r, g, b);      
      pixels[loc] = c;    
    }  
  }
}
