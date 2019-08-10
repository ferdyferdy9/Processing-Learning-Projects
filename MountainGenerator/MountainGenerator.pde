float dx = 2; //<>//
float dy = 2;
float dt = 0;
float size;

void setup() {
  size(640, 640, P3D);
  noStroke();
}

void draw() {
  dt += map(mouseY, height/2, height,   0,  0.1);
  size = map(mouseX, width/2, width, 200, 12.5);
  
  background(0);
  translate(width/2, height/2, 320);
  rotateX(-PI/12);
  lights();
  colorMode(HSB, 360, 100, 100);

  float y;
  for (int j=-height*4; j<0; j+=size) {
    beginShape(TRIANGLE_STRIP);
    for (int k=-width*2; k<=width*2; k+=size) {
      y = customPerlinNoise(k, j);
      vertex(k, height-y, j);
      
      y = customPerlinNoise(k, j+size);
      vertex(k, height-y, j+size);
    }
    endShape();
  }
}

float customPerlinNoise(float x, float y){
  x = map(x,  -width,  width, 0, dx);
  y = map(y, -height, height, 0, dy);
  fill(map(noise(x, y-dt), 0, 1, 0, 100), 60, 100);
  return noise(x, y-dt) * height;
}

void mousePressed(){
  stroke(0);
}

void mouseReleased(){
  noStroke();
}
