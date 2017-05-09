PImage tile;

class Floor{
  float x;
  float y;
  float w;
  float h;
  boolean isLast;
  
  Floor(float x, float y){
    this.x = x;
    this.y = y;
    tile = loadImage("sprites/Tile.png");
    w = 64;
    h = 64;
  }
  
  
  void draw(){
    imageMode(CENTER);
    image(tile,x,y,w,h);
  }

}