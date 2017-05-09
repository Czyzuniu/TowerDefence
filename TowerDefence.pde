PImage grass;
Floor bridge;
ArrayList<Floor>floor;
ArrayList<ourTank>ours;
ArrayList<Tank>enemy;
boolean setupMode = true;
Tank tank;
void setup(){
  size(600,600);
  grass = loadImage("sprites/Grass.png");
  grass.resize(width,height);
  floor = new ArrayList<Floor>();
  bridge = new Floor(45,286.5);
  bridge.isLast = true;
  floor.add(bridge);
  initFloor(45,32);
  initFloor(45,350);
  tank = new Tank(250,32);
  enemy = new ArrayList<Tank>();
  enemy.add(new Tank(45,32));
  enemy.add(tank);
  ours = new ArrayList<ourTank>();
  frameRate(60);
}



void draw(){
  background(grass);
  image(grass,0,0);
  for(Floor f: floor){
    f.draw();
  }
  
  for(ourTank t: ours){
      t.draw();
  }
   
  for(Tank t: enemy){
      t.draw();
  }
}



void initFloor(int x,int y){
  int max = width / 64;
  for(int i = 0; i < max; i++){
    floor.add(new Floor(x,y));
    x += 64;
  }
  
  for(int i = 0; i < 3; i++){
    y += 64;
    floor.add(new Floor(x-64,y));
  }
  
  for(int i = 0; i < max; i++){
        x -= 64;
    floor.add(new Floor(x,y));
  }
}


void mousePressed(){
  if(setupMode){
    Floor f;
    
    for(Floor s: floor){
      f = s;
      float d = dist(mouseX, mouseY, f.x, f.y);
    }
    
  }
  
  ours.add(new ourTank(mouseX, mouseY));
}