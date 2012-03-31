class Sphere {
  PVector position;
  float radius = 50;
  
  Sphere() {
    position = new PVector();
  }
  
  boolean collidesWith(Sphere otherSphere) {
    //compare the distance to combined radii
    float dx = position.x - otherSphere.position.x;
    float dy = position.y - otherSphere.position.y;
    float radii = radius + otherSphere.radius;
    return (( dx * dx )  + ( dy * dy ) < radii * radii );
  }
  
  void draw() {
    pushMatrix();
    translate(position.x, position.y);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }

}
