class FlowField {

  // A flow field is a two-dimensional array of PVectors.
  PVector[][] field;
  int cols, rows;
  int resolution;

  FlowField(int r) {
    resolution = r;
    //[full] Determine the number of columns and rows.
    cols = width/resolution;
    rows = height/resolution;
    //[end]
    field = new PVector[cols][rows];
    init();
  }

  void init() {
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff,yoff),0,1,0,TWO_PI);
        field[i][j] = new PVector(-cos(theta),-sin(theta));
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }

  PVector lookup(PVector lookup) {

    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return field[row][column].get();
  }
  
  void display(){
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        PVector f = PVector.mult(field[i][j],resolution);
        float x = (j+0.5)*resolution;
        float y = (i+0.5)*resolution;
        pushMatrix();
        translate(x,y);
        line(0,0,f.x,f.y);
        popMatrix();
      }
    }
  }
}
