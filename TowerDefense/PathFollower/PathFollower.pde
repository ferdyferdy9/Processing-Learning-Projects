Road r;
Follower f;

void setup(){
  size(600,600);
  
  r = new Road();
  
  float rad=0;
  r.add(width/4,height*3/5);
  while(rad < TWO_PI){
    r.add(width/2 + cos(rad)*250, height/2 + sin(rad)*250);
    rad += TWO_PI/10;
  }
  
  f = new Follower(width/2,height/2);
  f.path = r;
}

void draw(){
  background(200);
 //<>//
  r.display();
  f.display();
  
  f.applyBehaviour();
  f.update();
}
