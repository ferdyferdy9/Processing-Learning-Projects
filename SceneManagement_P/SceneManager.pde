class SceneManager{
  Map<String, Scene> sceneList = new HashMap<String, Scene>();
  String currScene="title";
  
  Boolean isTransparent=false;
  
  SceneManager(){
    sceneList.put("title", new Title());
    sceneList.put("game", new Game());
  }
  
  void setScene(String name){
    if(sceneList.containsKey(name))
      currScene = name;
    else
      println("Error: Scene \""+name+"\" not found.");
  }
  
  void update(){
    sceneList.get(currScene).update();
  }
  
  void display(){
    if(!isTransparent) background(200);
    sceneList.get(currScene).draw();
  }
  
  void step(){
    update();
    display();
  }
}
