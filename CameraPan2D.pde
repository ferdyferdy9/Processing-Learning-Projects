Camera2D camera = new Camera2D();

void setup(){
	size(600,600);
	
}

void draw(){
  camera.run();
  ellipse(0,0,200,200);
}
