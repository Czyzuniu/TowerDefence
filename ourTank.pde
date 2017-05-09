class ourTank{
  PVector pos = new PVector();
  PImage main;
  ArrayList<Bullet>bullets = new ArrayList<Bullet>();
  
  ourTank(float x, float y){
    this.pos.x = x;
    this.pos.y = y;
    main = loadImage("sprites/ourtank.png");
    main.resize(32,32);
  }
  
  void draw(){
    image(main,pos.x, pos.y);
    for(Bullet b: bullets){
      b.draw();
      for(Tank t:enemy){
          float d = dist(b.pos.x, b.pos.y, t.pos.x, t.pos.y);
            if(d < 5){
              
              //bullets.remove(b);
            }
          }
      }
      shoot();
 }

  
  
  void shoot(){
    Tank closest = findTarget();
    
    if(closest != null && frameCount % 5 == 0){
  
    Bullet b = new Bullet(pos.x, pos.y);
    b.target = closest;
    bullets.add(b);
    b.move();
    
    }
  }
  
  Tank findTarget(){
    Tank closest = null;
    for(int i = 0; i < enemy.size(); i++){
      float d = dist(pos.x, pos.y, enemy.get(i).pos.x, enemy.get(i).pos.y);
      println(d);
      if(d < 150){
        closest = enemy.get(i);
      }
    }
      return closest;
  }

}