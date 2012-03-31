class PlayerController extends CharacterController {
  PlayerController() {
    super();
    myColor = playerColor;
  }
  void update(int x, int y) {
    sphere.position.x = x;
    sphere.position.y = y;
  }
}
