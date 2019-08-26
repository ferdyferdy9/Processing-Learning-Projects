World world;

void setup(){
  size(600,600);
  world = new World();
  
}

void draw(){
  background(200);
  
  world.update();
  world.display();
}

void keyPressed(){
  world.b.vel.set(0,-15);
}
