class Bullet{
  PVector pos = new PVector();
  Tank target;
  Bullet(float x, float y){
    pos.x = x;
    pos.y = y;
    target = null;
  }
  
  
  void draw(){
    fill(0,255,0);
    rect(pos.x,pos.y,5,10);
    move();
  }
  
  
  void move(){
    if(target != null){
     PVector vel = new PVector(target.pos.x - pos.x, target.pos.y - pos.y);
     vel.setMag(5);
     this.pos.add(vel);
    
    }
  }
}