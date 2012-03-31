PlayerController player;
ArrayList<NPCController> npcs;
color playerColor = color(0,0,200);
color npcColor = color(200, 0, 0);

void setup() {
  size(800, 600);
  player = new PlayerController();
  
  npcs = new ArrayList<NPCController>();
  for (int i = 0; i<10; i++) {
    NPCController npc = new NPCController();
    npc.position.x = random(0, width);
    npc.position.y = random(0, height);
    npcs.add(npc);
  }
  
  ellipseMode(CENTER);
}

//------------------------------
void draw() {
  background(66);
  
  for (NPCController npc : npcs) {
    npc.draw();
  }
  
  player.update(mouseX, mouseY);
  player.draw();
}
