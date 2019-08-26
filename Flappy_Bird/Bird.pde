class Bird extends PVector{
  PVector vel = new PVector();
  PVector acc = new PVector();
  
  float w, h;
  
  PImage sprite;
  
  Bird(float x, float y, float w, float h, PImage sprite){
    this.set(x,y);
    this.w = w;
    this.h = h;
    this.sprite = sprite;
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void update(){
    vel.limit(20);
    vel.add(acc);
    this.add(vel);
    
    this.y = constrain(this.y, 0, height);
    
    acc.set(0,0);
  }
  
  void display(){
    pushMatrix();
    
    float theta = map(vel.y, -20, 20, -QUARTER_PI, QUARTER_PI);
    
    translate(this.x,this.y);
    rotate(theta);
    
    imageMode(CENTER);
    image(sprite, 0,0, w,h);
    
    popMatrix();
  }
}
