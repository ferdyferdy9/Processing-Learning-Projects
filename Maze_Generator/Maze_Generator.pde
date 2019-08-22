MazeGen mg;

void setup(){
  size(800,800);
  mg = new MazeGen();
}

void draw(){
  mg.update();
  mg.display();
}
