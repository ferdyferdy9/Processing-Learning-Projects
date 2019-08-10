Camera2D camera;

void setup(){
	size(600,600);
	camera = new Camera2D();
}

void draw(){
  camera.run();
  
  background(200);
  ellipse( 0,  0,100,100);
  ellipse(50,100, 50, 50);
}

void mouseWheel(MouseEvent e) {
  camera.scrollMode(e);
}
