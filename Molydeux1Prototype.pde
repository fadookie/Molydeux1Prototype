PlayerController player;
ArrayList<NPCController> npcs;
color playerColor = color(0,200,0);
color npcColor = color(255, 255, 255);
float cryIncreaseRate = 0.03;//In tears per second
float maxCryRate = 5; //tps

void setup() {
  size(800, 600);
  player = new PlayerController();
  
  npcs = new ArrayList<NPCController>();
  for (int i = 0; i<10; i++) {
    NPCController npc = new NPCController();
    npc.sphere.position.x = random(0, width);
    npc.sphere.position.y = random(0, height);
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
