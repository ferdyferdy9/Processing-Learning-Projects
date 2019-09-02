Road r;
Follower[] followers;

void setup(){
  size(600,600);
  
  r = new Road();
  
  float rad=0;
  //r.add(width/4,height*3/5);
  //while(rad < TWO_PI){
  //  r.add(width/2 + cos(rad)*250, height/2 + sin(rad)*250);
  //  rad += TWO_PI/10;
  //}
  r.add(100,100);
  r.add(200,100);
  r.add(200,200);
  r.add(250,200);
  r.add(250,300);
  r.add(200,300);
  r.add(200,500);
  r.add(400,500);
  r.add(400,100);
  r.add(300,100);
  r.add(300,200);
  r.add(500,200);
  r.add(500,400);
  r.add(100,400);
  
  followers = new Follower[100];
  for(int i=0; i<100; i++){
    followers[i] = new Follower(random(width),random(height));
    followers[i].path = r;
  }
}

void draw(){
  background(200);
 //<>//
  r.display();
  
  for(Follower f : followers){
    f.display();
    f.applyBehaviour();
    f.update();
  }
}

void keyPressed(){
  for(int i=0; i<100; i++){
    followers[i] = new Follower(random(width),random(height));
    followers[i].path = r;
  }
}
