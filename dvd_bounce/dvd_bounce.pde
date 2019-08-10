PVector pos = new PVector();
PVector vel = new PVector();
PImage dvd;

void setup(){
  size(1000,800);
  dvd = loadImage("DVD_logo.png");
  
  pos.x = random(width-150);
  pos.y = random(height-150);
  vel.x =   2;
  vel.y =  -2;
}

void draw(){
  if(pos.x < 0 || pos.x+150 > width){
    vel.x *= -1;
    tint(random(255),random(255),random(255));
  }
  if(pos.y < 0 || pos.y+100 > height){
    vel.y *= -1;
    tint(random(255),random(255),random(255));
  }
  
  pos.x = pos.x + vel.x;
  pos.y = pos.y + vel.y;
  
  background(0);
  
  image(dvd, pos.x, pos.y, 150,100);
}
