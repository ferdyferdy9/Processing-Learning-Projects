import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;
import toxi.geom.*;

VerletPhysics2D physics;
FlowField flow;
ArrayList<Fish> pool;
Boolean pause=false;

void setup(){
  size(640,640);
  
  physics=new VerletPhysics2D();
  flow = new FlowField(1);
  
  pool = new ArrayList<Fish>();
}

void draw() {
  background(#789CAF);
  // This is the same as Box2D’s “step()” function
  physics.update();
  
  if(keyPressed)
    pool.add(new Fish(mouseX,mouseY,5,40));
  
  for(Fish f : pool){
    f.applyBehaviour();
    
    if(f.getHead().x < 0){
      f.addPosition(new Vec2D( width,0));
    }
    if(f.getHead().x > width){
      f.addPosition(new Vec2D(-width,0));
    }
    if(f.getHead().y < 0){
      f.addPosition(new Vec2D(0,height));
    }
    if(f.getHead().y > height){
      f.addPosition(new Vec2D(0,-height));
    }
    
    f.display(); 
  }
}

void mouseClicked(){
  pool.add(new Fish(mouseX,mouseY,5,40));
}
