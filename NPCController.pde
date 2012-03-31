class NPCController extends CharacterController {
  float cryRate = 0.001;
  Sphere influence;
  HashSet<CharacterController> influencers;
  PVector velocity;
  float wiggleIntervalMs = 1000;
  float lastWiggleMs = 0;
  
  NPCController() {
    super();
    construct();
  }
  
  void construct() {
    myColor = npcColor;
    influence = new Sphere();
    velocity = new PVector();
    influence.position = sphere.position; //Assign by reference so it keeps up to date.
    influence.radius = npcInfluenceRadius;
    cryInfluenceRate = cryIncreaseRate;
    influencers = new HashSet<CharacterController>();
  }
  
  void update() {
    //Inefficient linear search for influencers
    for (NPCController otherNpc : npcs) {
      if ((this != otherNpc)
           && sphere.collidesWith(otherNpc.influence)
           && otherNpc.isBawling()
      ) {
        influencers.add(otherNpc);
      } else {
        influencers.remove(otherNpc);
      }
    }
    
    if (sphere.collidesWith(player.sphere)) {
      influencers.add(player);
    } else {
      influencers.remove(player);
    }
    
    for (CharacterController influencer : influencers) {
      cryRate += influencer.cryInfluenceRate;
    }
 
    cryRate -= cryDecreaseRate;
    cryRate = constrain(cryRate, 0.001, maxCryRate);
    //println("cryRate: " + cryRate + " influencers: " + influencers);
    myColor = color((1/cryRate) * 200, (1/cryRate) * 200, 255);
    
    if (npcWiggle
        && ((millis() - lastWiggleMs) > wiggleIntervalMs)
    ) {
      velocity.x = random(-0.5, 0.5);
      velocity.y = random(-0.5, 0.5);
      wiggleIntervalMs = random (500, 2000);
      lastWiggleMs = millis();
    }
    
    sphere.position.add(velocity);
  }
  
  void draw() {
    super.draw();
    if (DEBUG) {
      //Draw influence circle
      pushStyle();
      stroke(myColor);
      noFill();
      influence.draw();
      popStyle();
    }
  }
  
  boolean isBawling() {
    return (cryRate >= maxCryRate);
  }
}
