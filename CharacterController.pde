class CharacterController {
  PVector position;
  float radius = 50;
  color myColor;
  
  CharacterController() {
    position = new PVector();
    myColor = color(0,0,0);
  }
  
  void draw() {
    pushMatrix();
    pushStyle();
    stroke(myColor);
    fill(myColor);
    translate(position.x, position.y);
    ellipse(0, 0, radius, radius);
    pushStyle();
    popMatrix();
  }
  
  boolean collidesWith(CharacterController otherChar) {
    //compare the distance to combined radii
    float dx = position.x - otherChar.position.x;
    float dy = position.y - otherChar.position.y;
    float radii = radius + otherChar.radius;
    return (( dx * dx )  + ( dy * dy ) < radii * radii );
  }
}
