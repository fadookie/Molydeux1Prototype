class NPCController extends CharacterController {
  NPCController() {
    super();
    construct();
  }
  
  void construct() {
    myColor = npcColor;
  }
  
  void update() {
    if (this.collidesWith(player)) {
      myColor = color(0, 255, 0);
    } else {
      myColor = npcColor;
    }
  }
}
