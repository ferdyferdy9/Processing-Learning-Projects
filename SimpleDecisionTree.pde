PImage img;
BoxFactory bf;
int x, y;

void setup() {
  size(180,320);
  img = loadImage("set1_ans.png");
  
  bf = new BoxFactory(img);
  noCursor();
}

void draw() {
  image(img,0,0);
  
  x = constrain(mouseX, 24, width-25);
  y = constrain(mouseY, 24, height-25);
  translate(x,y);
  
  stroke(255,0,0);
  noFill();
  rect(-25,-25,49,49);
  
  for(int k=-25; k<24; k+=6){
    for(int i=-25; i<24; i+=6){
      point(i,k);
    }
  }
}

void keyPressed(){
  Box b = bf.createSample(x,y);
  println(b);
}
