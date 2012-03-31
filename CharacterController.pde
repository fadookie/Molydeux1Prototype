class CharacterController {
  color myColor;
  Sphere sphere;
  String tag = "";
  
  float cryInfluenceRate = 0;
  
  CharacterController() {
    myColor = color(0,0,0);
    sphere = new Sphere();
  }
  
  void draw() {
    pushStyle();
    stroke(myColor);
    fill(myColor);
    sphere.draw();
    popStyle();
  }
}
