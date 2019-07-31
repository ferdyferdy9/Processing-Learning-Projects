PImage img;
BoxFactory bf;

void setup() {
  size(180,320);
  img = loadImage("set1_ans.png");
  
  bf = new BoxFactory(img);
}

void draw() {
  image(img,0,0);
  
  stroke(255,0,0);
  noFill();
  rectMode(CENTER);
  rect(mouseX,mouseY,51,51);
}

void keyPressed(){
  Box b = bf.createSample(mouseX,mouseY);
  
  println(b);
}
