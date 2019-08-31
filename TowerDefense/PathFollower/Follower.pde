class Follower extends Boid{
  Follower(){}
  Follower(float x, float y){super(x,y);}
  
  void applyBehaviour(){
    acc.add(followPath());
  }
  
  void display(){
    pushMatrix();
    fill(100);
    noStroke();
    
    translate(x,y);
    PathFollower.this.rotate(atan2(vel.y,vel.x));
    
    beginShape();
    vertex(-10,-10);
    vertex(-10, 10);
    vertex( 20,  0);
    endShape(CLOSE);
    
    popMatrix();
  }
}
