class Box{
  int[][] data;
  Boolean value;
  
  Box(int size){
    data = new int[size][size];
  }
  
  Box(int w, int h){
    data = new int[h][w];
  }
  
  void set(int x, int y, int value){
    data[y][x] = (value == 0) ? 0 : 1;
  }
  
  int get(int x, int y){
    return data[y][x];
  }
  
  void display(float x, float y, float size){
    pushMatrix();
    translate(x,y);
    
    // if value true then   BLUE    else     RED
    color c = value ? color(0,0,255) : color(255,0,0);
    
    stroke(c);
    for(int k=0; k<data.length; k++){
      for(int i=0; i<data[0].length; i++){
        if(data[k][i] == 1)
          fill(c);
        else
          noFill();
        
        rect(i*size,k*size,size,size);
      }
    }
    
    popMatrix();
  }
  
  String toString(){
    String s = "";
    
    for(int k=0; k<data.length; k++){
      s = s.concat("{");
      
      for(int i=0; i<data[0].length; i++){
        s = s.concat(data[k][i]+"");
        if(i != data.length-1)
          s = s.concat(", ");
      }
      
      s = s.concat("},\n");
    }
        
    return s;
  }
}
