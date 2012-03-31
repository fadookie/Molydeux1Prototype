PlayerController player;
ArrayList<NPCController> npcs;
color playerColor = color(0,200,0);
color npcColor = color(255, 255, 255);
float cryIncreaseRate = 0.03;//In tears per second
float cryDecreaseRate = 0.01;//Sadness entropy in tears per second
float maxCryRate = 5; //tps
float npcInfluenceRadius = 100;

static final boolean DEBUG = true;

void setup() {
  size(800, 600);
  smooth();
  player = new PlayerController();
  
  npcs = new ArrayList<NPCController>();
  for (int i = 0; i<10; i++) {
    NPCController npc = new NPCController();
    if (i == 0) {
      npc.sphere.position.x = (width/2);
      npc.sphere.position.y = (height/2);
    } else {
      npc.sphere.position.x = random(0, width);
      npc.sphere.position.y = random(0, height);
    }

    npc.tag = "" + i;
    npcs.add(npc);
  }
  
  ellipseMode(RADIUS);
}

//------------------------------
void draw() {
  background(66);
  
  for (NPCController npc : npcs) {
    npc.update();
    npc.draw();
  }
  
  player.update(mouseX, mouseY);
  player.draw();
}
