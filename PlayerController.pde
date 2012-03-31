class PlayerController extends CharacterController {
  PlayerController() {
    super();
    myColor = playerColor;
  }
  void update(int x, int y) {
    position.x = x;
    position.y = y;
  }
}
