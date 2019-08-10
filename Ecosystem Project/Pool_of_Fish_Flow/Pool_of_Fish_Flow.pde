import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;
import toxi.geom.*;

VerletPhysics2D physics;
FlowField flow;
ArrayList<Fish> f;
Boolean pause=false;

void setup(){
  size(640,640);
  
  physics=new VerletPhysics2D();
  flow = new FlowField(1);
  
  f = new ArrayList<Fish>();
}

void draw() {
  background(#789CAF);
  // This is the same as Box2D’s “step()” function
  physics.update();
  
  if(mousePressed){
    f.add(new Fish(mouseX,mouseY,5,40));
  }
  
  for(Fish f : f){
    f.follow(flow);
    
    if(f.getHead().x < 0){
      f.setPosition(new PVector(width,height/2));
    }
    if(f.getHead().x > width){
      f.setPosition(new PVector(    0,height/2));
    }
    if(f.getHead().y < 0){
      f.setPosition(new PVector(width/2,height));
    }
    if(f.getHead().y > height){
      f.setPosition(new PVector(width/2,0));
    }
    
    f.display(); 
  }
  
  if(keyPressed)
    flow.display();
}
