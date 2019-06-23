Camera2D camera;

void setup(){
	size(600,600);
	camera = new Camera2D();
}

void draw(){
  camera.run();
  ellipse(0,0,100,100);
}
