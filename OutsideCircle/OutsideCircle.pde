Point A = new Point(200,100);
Point B = new Point(200,500);
Point C = new Point(400,100);
Point p;

PVector circle = new PVector();
PVector mouse = new PVector();

void setup(){
  size(600,600);
}

void draw(){
  background(200);
  
  // input
  if(p!=null){
    p.x = mouseX;
    p.y = mouseY;
  }
  
  // logic
  float P  = A.x - B.x;
  float Q  = A.x - C.x;
  float R  = B.x - C.x;
  float Px = A.x*A.x - B.x*B.x;
  float Qx = A.x*A.x - C.x*C.x;
  float Rx = B.x*B.x - C.x*C.x;
  float Py = A.y*A.y - B.y*B.y;
  float Qy = A.y*A.y - C.y*C.y;
  float Ry = B.y*B.y - C.y*C.y;
  
  float x = 0.5 * (A.y*(Rx+Ry) - B.y*(Qx+Qy) + C.y*(Px+Py))
                / (A.y*   R    - B.y*   Q    + C.y*   P   );
  
  float y = (A.y-B.y != 0) ? (Px+Py - 2*x*P)/(2*(A.y-B.y))
          : (Qx+Qy - 2*x*Q)/(2*(A.y-C.y));
  
  circle.set(x,y);
  float r = circle.dist(A);
  
  stroke(0);
  noFill();
  ellipse(x, y, r*2, r*2);
  ellipse(x, y, 20, 20);
  
  // display
  stroke(0,160,128);
  line(0,(Px+Py - 2*0*P)/(2*(A.y-B.y)),600,(Px+Py - 2*600*P)/(2*(A.y-B.y)));
  line(0,(Qx+Qy - 2*0*Q)/(2*(A.y-C.y)),600,(Qx+Qy - 2*600*Q)/(2*(A.y-C.y)));
  line(0,(Rx+Ry - 2*0*R)/(2*(B.y-C.y)),600,(Rx+Ry - 2*600*R)/(2*(B.y-C.y)));
  
  stroke(#F0CB52);
  strokeWeight(5);
  line(A.x, A.y, B.x, B.y);
  line(A.x, A.y, C.x, C.y);
  line(B.x, B.y, C.x, C.y);
  
  noStroke();
  fill(200,100,100);
  A.display();
  B.display();
  C.display();
}

void mousePressed(){
  mouse.set(mouseX,mouseY);
  if(A.intersect(mouse))
    p = A;
  if(B.intersect(mouse))
    p = B;
  if(C.intersect(mouse))
    p = C;
}

void mouseReleased(){
  p = null;
}
