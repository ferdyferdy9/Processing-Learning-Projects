class Body extends VerletParticle2D{

  Body(float x, float y) {
    super(new Vec2D(x,y));
  }

  void display() {
    fill(0,150);
    stroke(0);
    ellipse(x,y,2,2);
  }
}
