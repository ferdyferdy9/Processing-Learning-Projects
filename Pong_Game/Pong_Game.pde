Bola b = new Bola(width/2, height/2);
Player p1 = new Player( 50, 250);
Player p2 = new Player(550, 250);

int scoreA = 0;
int scoreB = 0;

float dt =0;

void setup() {
  size(600, 600);
}

void draw() {
  background(200);

  // game engine :
  // 1. input
  // 2. update
  // 3. logic
  // 4. draw

  // update
  b.update();
  p1.update();
  p2.update();
  
  p2.pos.y = map(noise(dt), 0 , 1, 0, height);
  dt+=0.01;

  // logic
  // kolusi player dan bola
  if (p1.apakahKenaBola(b) || p2.apakahKenaBola(b))
    b.vel.x *= -1; 

  // apakah bola keluar
  if (b.pos.x < 0) {
    scoreB++;
    b.pos.set(width/2, height/2);
  }

  if (b.pos.x > width) {
    scoreA++;
    b.pos.set(width/2, height/2);
  }

  // mantul di tembok
  if (b.pos.y < 0 || b.pos.y > height)
    b.vel.y *= -1;

  // draw
  fill(255);
  b.display();
  p1.display();
  p2.display();

  fill(0);
  textSize(32);
  text(scoreA+" : "+scoreB, width/2, 100);
}

void keyPressed() {
  // input 
  if (keyCode == 'W') {
    p1.vel.y = -2;
  }
  if (keyCode == 'S') {
    p1.vel.y =  2;
  }
}

void keyReleased(){
  p1.vel.set(0,0);
}
