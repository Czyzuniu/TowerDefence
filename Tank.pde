class Tank{
  PVector pos;
  PImage left;
  PImage right;
  PImage down;
  PImage up;
  boolean facingLeft;
  boolean facingDown;
  float xSpeed;
  float ySpeed;
  ArrayList<PVector> movePath;
  int currentPath;
  
  Tank(float x, float y){
    pos = new PVector();
    pos.x = x;
    pos.y = y;
    left = loadImage("sprites/tankleft.png");
    right = loadImage("sprites/tankright.png");
    down = loadImage("sprites/tankdown.png");
    up = loadImage("sprites/tankup.png");
    left.resize(64,64);
    right.resize(64,64);
     up.resize(64,64);
    down.resize(64,64);
    facingLeft = false;
    movePath = new ArrayList<PVector>();
    createPaths();
  }
  
  void draw(){
      
     if(facingLeft){
           image(left,pos.x,pos.y);
     }
     else if(facingLeft == false && facingDown != false){
         image(right,pos.x,pos.y);
     }
     else if(facingDown){
       image(up,pos.x,pos.y);
     }else if (facingDown == false){
           image(down,pos.x,pos.y);
     }

    move();
  }
  
  
  void move(){
    
    if(currentPath < 8){
      
    PVector vel = new PVector(movePath.get(currentPath).x- pos.x, movePath.get(currentPath).y - pos.y);
    vel.setMag(3); 
    
    this.pos.add(vel);
    
    float d = dist(pos.x,pos.y,movePath.get(currentPath).x,movePath.get(currentPath).y);
    
    if(d < 10){
      currentPath++;
    }
    
    if(xSpeed > 0){
      facingLeft = false;
    }else{
      facingLeft = true;
    }
    
    if(ySpeed > 0){
      facingDown = false;
    }else{
      facingDown = true;
    }
 
    }
    
  }
  
  
  void createPaths(){
    Floor last = floor.get(9);
    PVector fpath = new PVector(last.x,last.y);
    movePath.add(fpath);
    
    last = floor.get(12);
    PVector spath = new PVector(last.x,last.y);
    movePath.add(spath);
    
    
    last = floor.get(21);
    spath = new PVector(last.x,last.y);
    movePath.add(spath);
    
    last = floor.get(0);
    spath = new PVector(last.x,last.y);
    movePath.add(spath);
    
    last = floor.get(22);
    spath = new PVector(last.x,last.y);
    movePath.add(spath);
    
    last = floor.get(30);
    spath = new PVector(last.x,last.y);
    movePath.add(spath);
    
    last = floor.get(34);
    spath = new PVector(last.x,last.y);
    movePath.add(spath);
    
    last = floor.get(42);
    spath = new PVector(last.x,last.y);
    movePath.add(spath);

  }
}