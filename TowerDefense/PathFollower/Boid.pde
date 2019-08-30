abstract class Boid extends PVector{
  PVector vel = new PVector(2,1);
  
  int lastPoint = 0;
  int nextPoint = 1;
  
  float followSpeed=5;
  
  Boid(){}
  Boid(float x, float y){super(x,y);}
  
  void followPath(Path path){
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
    
    if(target.mag() > path.followRadius){
      vel = target.normalize().mult(followSpeed);
    } 
    else {
      vel = PVector.sub(nextPos,this).normalize().mult(followSpeed);
    }
  }
  
  void update(){
    this.add(vel);
  }
}
