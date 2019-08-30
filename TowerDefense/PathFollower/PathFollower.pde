Road r;
Follower f;

void setup(){
  size(600,600);
  
  r = new Road();
  
  for(int i=0; i<10; i++){
    r.add(random(0,width), random(0,height));
  }
  
  f = new Follower(width/2,height/2);
}

void draw(){
  background(200);
  
  f.followPath(r);
  f.update(); //<>//
  
  r.display();
  f.display();
}
