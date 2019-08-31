abstract class Boid extends PVector{
  PVector vel = new PVector(2,1);
  PVector acc = new PVector();
  
  Path path;
  int lastPoint = 0;
  int nextPoint = 1;
  
  float followSpeed = 5;
  
  Boid(){}
  Boid(float x, float y){super(x,y);}
  
  PVector followPath(){
    PVector lastPos = path.get(lastPoint);
    PVector nextPos = path.get(nextPoint);
    PVector currPos = PVector.sub(this,lastPos);
    
    if(PVector.sub(nextPos, this).mag() < path.followRadius){
      lastPoint = nextPoint;
      nextPoint++;
      
      if(nextPoint == path.size()){
        nextPoint = 0;
      }
    }
    
    PVector closest = PVector.sub(nextPos, lastPos).normalize();
    
    PVector target = PVector.sub(closest.mult(currPos.dot(closest)), currPos);
    
    PVector desire;
    
    if(target.mag() < path.followRadius){
      target = PVector.sub(nextPos,this);
    }
    
    if(target.mag() > followSpeed*20)
      desire = target.copy().normalize().mult(followSpeed);
    else
      desire = target.copy().normalize().mult(map(target.mag(),0,followSpeed*20,followSpeed/2,followSpeed));
    
    desire.sub(vel);
    desire.limit(followSpeed*0.1);
    
    strokeWeight(2);
    stroke(255);
    line(x,y,desire.copy().mult(100).add(this).x,desire.copy().mult(100).add(this).y);
    
    return desire;
  }
  
  abstract void applyBehaviour();
  
  void update(){
    vel.add(acc);
    this.add(vel);
    
    acc.set(0,0);
  }
}
