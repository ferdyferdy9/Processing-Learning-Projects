class Fish {
  ArrayList<Body> bones;

  float headRadius;
  float len;
  float str = 0.9;
  float numFins = 8;
  float maxSpeed = 3;
  float maxForce = 0.4;
  float dt;

  Fish(float x, float y, float size, float len) {
    bones = new ArrayList<Body>();
    dt = random(0,1000);
    
    /// head
    bones.add(new Body(x, y));
    headRadius = size;

    // north
    bones.add(new Body(x, y-size));
    physics.addSpring(new VerletSpring2D(
      bones.get(0), bones.get(1), size, 1
      ));
    // south
    bones.add(new Body(x, y+size));
    physics.addSpring(new VerletSpring2D(
      bones.get(0), bones.get(2), size, 1
      ));

    /// tail
    this.len = len;
    float finDist = (len-size*2)/numFins;
    float dist;
    Body p;
    for (int i=0; i < numFins; i++) {
      size = headRadius*map(i,0,numFins,1,0.01);
      // bone
      p = new Body(x-finDist*(i+1), y); 
      bones.add(p);
      physics.addSpring(new VerletSpring2D(
        p, bones.get(i*3), finDist, 1
        ));
      
      // north
      p = new Body(x-finDist*(i+1), y-size);
      bones.add(p);
      dist = new PVector(p.x,p.y).dist(new PVector(bones.get(i*3).x,bones.get(i*3).y));
      physics.addSpring(new VerletSpring2D(
        p, bones.get(i*3)  , dist, str
        ));
      physics.addSpring(new VerletSpring2D(
        p, bones.get(i*3+1), finDist, str
        ));
      physics.addSpring(new VerletSpring2D(
        p, bones.get(i*3+3), size, str
        ));
      
      // south
      p = new Body(x-finDist*(i+1), y+size);
      bones.add(p);
      dist = new PVector(p.x,p.y).dist(new PVector(bones.get(i*3).x,bones.get(i*3).y));
      physics.addSpring(new VerletSpring2D(
        p, bones.get(i*3)  , dist, str
        ));
      physics.addSpring(new VerletSpring2D(
        p, bones.get(i*3+2), finDist, str
        ));
      physics.addSpring(new VerletSpring2D(
        p, bones.get(i*3+3), size, str
        ));
        
      // extra support
      physics.addSpring(new VerletMinDistanceSpring2D(
        p, bones.get(i*3+1), size, 1
        ));
      physics.addSpring(new VerletMinDistanceSpring2D(
        p, bones.get(i*3+3), 0.01, 1
        ));
    }

    for (Body b : bones) {
      b.setWeight(0.01);
      physics.addParticle(b);
    }
    
    bones.get(0).setWeight(random(1,5));
  }
  
  Vec2D follow(FlowField flow) {
    Vec2D previous = bones.get(0).getPreviousPosition();
    PVector lastPos = new PVector(previous.x,previous.y);
    PVector pos = new PVector(bones.get(0).x,bones.get(0).y);
    PVector vel = PVector.sub(pos,lastPos);
    
    // What is the vector at that spot in the flow field?
    PVector desired = flow.lookup(pos);
    desired.mult(maxSpeed);

    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    return new Vec2D(steer.x,steer.y);
  }
  
  Vec2D separate (ArrayList<Fish> pool) {
    // Note how the desired separation is based
    // on the Vehicle’s size.
    float desiredseparation = headRadius*8; //[bold]
    Vec2D sum = new Vec2D();
    int count = 0;
    for (Fish o : pool) {
      float d = getHead().distanceTo(o.getHead());
      if ((d > 0) && (d < desiredseparation)) {
        Vec2D diff = getHead().sub(o.getHead());
        diff.normalize();
        // What is the magnitude of the PVector
        // pointing away from the other vehicle?
        // The closer it is, the more we should flee.
        // The farther, the less. So we divide
        // by the distance to weight it appropriately.
        diff.scaleSelf(1.0/d);
        sum.addSelf(diff);
        count++;
      }
    }
    
    if (count > 0) {
      sum.scaleSelf(1.0/count);
      sum.normalize();
      sum.scaleSelf(maxSpeed);
      
      Vec2D lastPos = bones.get(0).getPreviousPosition();
      Vec2D pos = bones.get(0);
      Vec2D vel = pos.sub(lastPos);
      
      Vec2D steer = sum.sub(vel);
      steer.limit(maxForce);
      return steer;
    }
    return new Vec2D();
  }
  
  Vec2D wander(){
    float angle = noise(dt)*PI*4;
    
    Vec2D lastPos = bones.get(0).getPreviousPosition();
    Vec2D pos = bones.get(0);
    Vec2D vel = pos.sub(lastPos);
    
    Vec2D temp = new Vec2D(vel.x,vel.y);
    
    Vec2D sight = temp.normalize().scale(100);
    Vec2D target = pos.add(sight);
    target.addSelf(Vec2D.fromTheta(angle).scale(40));
    Vec2D desired = target.sub(pos);
    
    desired.normalize();
    desired.scaleSelf(maxSpeed);
    
    Vec2D steer = desired.sub(vel);
    steer.limit(maxForce);
    return steer;
  }
  
  void applyBehaviour(){
    Vec2D total = new Vec2D();
    total.addSelf(separate(pool));
    total.addSelf(wander());
    getHead().addForce(total);
  }
  
  Body getHead(){
    return bones.get(0);
  }
  
  void addPosition(Vec2D pos){
    for (Body b : bones) {
      b.addSelf(pos);
      Vec2D previous = b.getPreviousPosition();
      previous.addSelf(pos);
      b.setPreviousPosition(previous);
    }
  }
  
  void update(){
    Vec2D previous = bones.get(0).getPreviousPosition();
    PVector lastPos = new PVector(previous.x,previous.y);
    PVector pos = new PVector(bones.get(0).x,bones.get(0).y);
    PVector vel = PVector.sub(pos,lastPos);
    vel.normalize();
    vel.mult((len-headRadius*2)/numFins);
    
    // Main bones
    PVector newPos = pos.get();
    Vec2D prev;
    for(int i=3; i<bones.size();i+=3){
      newPos = PVector.sub(newPos,vel);
      bones.get(i).x = newPos.x;
      bones.get(i).y = newPos.y;
      prev = new Vec2D();
      prev.x = newPos.x;
      prev.y = newPos.y;
      bones.get(i).setPreviousPosition(prev);
    }
    
    // head
    vel.normalize();
    vel.mult(headRadius);
    vel.rotate(radians(90));
    newPos = PVector.sub(pos,vel);
    bones.get(1).x = newPos.x;
    bones.get(1).y = newPos.y;
    prev = new Vec2D();
    prev.x = newPos.x;
    prev.y = newPos.y;
    bones.get(1).setPreviousPosition(prev);
    
    vel.rotate(radians(180));
    newPos = PVector.sub(pos,vel);
    bones.get(2).x = newPos.x;
    bones.get(2).y = newPos.y;
    prev = new Vec2D();
    prev.x = newPos.x;
    prev.y = newPos.y;
    bones.get(2).setPreviousPosition(prev);
  }
  
  void display(){
    update();
    dt+=0.001;
    
    stroke(0);
    fill(255);
    
    // body
    beginShape();
    for(int i=1;i<bones.size();i+=3){
      vertex(bones.get(i).x,bones.get(i).y);
    }
    for(int i=bones.size()-1;i>1;i-=3){
      vertex(bones.get(i).x,bones.get(i).y);
    }
    endShape();
    
    //debug();
    
    // head
    fill(255);
    ellipse(bones.get(0).x,bones.get(0).y,headRadius*2,  headRadius*2);
  }
  
  void debug(){
    stroke(0);
    noFill();
    
    // main bone
    stroke(0,0,255);
    beginShape();
    for(int i=0;i<bones.size();i+=3){
      vertex(bones.get(i).x,bones.get(i).y);
    }
    endShape();
    
    // fins
    stroke(255,0,0);
    for(int i=0;i<bones.size();i+=3){
      beginShape();
      vertex(bones.get(i+2).x,bones.get(i+2).y);
      vertex(bones.get(i).x,bones.get(i).y);
      vertex(bones.get(i+1).x,bones.get(i+1).y);
      endShape();
    }
    
    // support
    stroke(255,0,0);
    for(int i=3;i<bones.size();i+=3){
      beginShape();
      vertex(bones.get(i+1).x,bones.get(i+1).y);
      vertex(bones.get(i-3).x,bones.get(i-3).y);
      endShape();
      beginShape();
      vertex(bones.get(i+2).x,bones.get(i+2).y);
      vertex(bones.get(i-3).x,bones.get(i-3).y);
      endShape();
    }
    
    for(Body b : bones){
      b.display();
    }
  }
}
