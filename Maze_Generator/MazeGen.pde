class MazeGen{
  int x=0, y=0;
  int size=32;
  
  Tile[][] tiles;
  ArrayList<Tile> stack = new ArrayList<Tile>();
  
  MazeGen(){
    tiles = new Tile[width/size][height/size];
  }
  
  void update(){
    Tile current = tiles[y][x]; //<>//
    
    if(current == null){
      Tile t = new Tile(x*size,y*size,size);
      tiles[y][x] = t;
      current = t;
      
      stack.add(t);
    }
    
    if(y == 0) 
      current.up = true;
    if(y == height/size) 
      current.down = true;
    if(x == 0) 
      current.left = true;
    if(x == width/size) 
      current.right = true;
    
    if(
       (y>0             && tiles[y-1][x] == null) ||
       (y<height/size-1 && tiles[y+1][x] == null) ||
       (x>0             && tiles[y][x-1] == null) ||
       (x< width/size-1 && tiles[y][x+1] == null)
    ) {
      
      while(true){
        int chance = (int) random(0,4);
        
        if(chance == 0 && y>0           && tiles[y-1][x] == null){
          current.up = true;
          y--;
          tiles[y][x] = new Tile(x*size,y*size,size);
          tiles[y][x].down = true;
          stack.add(tiles[y][x]);
          break;
        }
        else if(chance == 1 && y<height/size-1 && tiles[y+1][x] == null){
          current.down = true;
          y++;
          tiles[y][x] = new Tile(x*size,y*size,size);
          tiles[y][x].up = true;
          stack.add(tiles[y][x]);
          break;
        }
        else if(chance == 2 && x>0           && tiles[y][x-1] == null){
          current.left = true;
          x--;
          tiles[y][x] = new Tile(x*size,y*size,size);
          tiles[y][x].right = true;
          stack.add(tiles[y][x]);
          break;
        }
        else if(chance == 3 && x< width/size-1 && tiles[y][x+1] == null){
          current.right = true;
          x++;
          tiles[y][x] = new Tile(x*size,y*size,size);
          tiles[y][x].left = true;
          stack.add(tiles[y][x]);
          break;
        }
      }
    }
    else {
      x = stack.get(stack.size()-2).x/size;
      y = stack.get(stack.size()-2).y/size;
      stack.remove(stack.size()-1);
    }
  }
  
  Boolean check(){
    for(Tile s : stack){
      if(s.x == x && s.y == y)
        return true;
    }
    return false;
  }
  
  void display(){
    for(int k=0; k<tiles.length;k++)
      for(int m=0; m<tiles.length;m++)
        if(tiles[k][m] != null)
          tiles[k][m].display(color(255));
    
    for(Tile s : stack)
      s.display(color(0,255,255));
    
    noStroke();
    fill(255,128,0,50);
    rect(x*size,y*size,size,size);
  }
}
