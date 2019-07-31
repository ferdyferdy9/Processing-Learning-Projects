class Box{
  int[][] data;
  
  Box(int size){
    data = new int[size][size];
  }
  
  void set(int x, int y, int value){
    data[y][x] = (value == 0) ? 0 : 1;
  }
  
  int get(int x, int y){
    return data[y][x];
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
