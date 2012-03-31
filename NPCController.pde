class NPCController extends CharacterController {
  float cryRate = 0.001;
  
  NPCController() {
    super();
    construct();
  }
  
  void construct() {
    myColor = npcColor;
  }
  
  void update() {
    if (sphere.collidesWith(player.sphere)) {
      cryRate += cryIncreaseRate;
      //println("cryRate: " + cryRate);
    } else {
      cryRate -= cryIncreaseRate;
    }
    cryRate = constrain(cryRate, 0.001, maxCryRate);
    myColor = color((1/cryRate) * 200, (1/cryRate) * 200, 255);
  }
}
