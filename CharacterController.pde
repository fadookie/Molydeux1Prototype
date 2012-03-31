class CharacterController {
  PVector position;
  PVector size;
  color myColor;
  
  CharacterController() {
    position = new PVector();
    size = new PVector(100, 100);
    myColor = color(0,0,0);
  }
  
  void draw() {
    pushMatrix();
    pushStyle();
    stroke(myColor);
    fill(myColor);
    translate(position.x, position.y);
    ellipse(0, 0, size.x, size.y);
    pushStyle();
    popMatrix();
  }
}
