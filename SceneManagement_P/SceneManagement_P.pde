import java.util.Map;

SceneManager sm;

void setup(){
  size(600,600);
  sm = new SceneManager();
}

void draw(){
  sm.update();
  sm.display();
}

void keyPressed(){
  switch(key){
    case 'a':
      sm.setScene("title");
      break;
      
    case 's':
      sm.setScene("game");
      break;
    
    case 'd':
      sm.setScene("options");
      break;
    
    default:
      sm.isTransparent = !sm.isTransparent;
  }
}
