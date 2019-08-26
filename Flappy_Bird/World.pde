class World{
  ArrayList<Pipe> pipes = new ArrayList<Pipe>();
  Bird b;
  
  float distance = 200;
  
  PVector gravity = new PVector(0, 0.978);

  World(){
    b = new Bird(100, 50, 60, 50, loadImage("flappy2.png"));
    
    float offset = 300;
    
    for(int i=0; i<10; i++){
      float h = random(350,height-100);
      
      pipes.add(new Pipe(width+i*offset, 0, 100, h-distance)); 
      pipes.add(new Pipe(width+i*offset, h, 100, height-h)); 
    }
  }
  
  void update(){
    b.applyForce(gravity);
    b.update();
     
    for(Pipe p : pipes)
      p.update();
    
  }
  
  void display(){
    b.display();
    
    for(Pipe p : pipes)
      p.display();
    
  }
}
