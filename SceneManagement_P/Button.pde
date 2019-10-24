abstract class Button{
  PVector pos = new PVector();
  
  abstract void update();
  abstract void draw();
  void onClick(){}
  void onHover(){}
}
