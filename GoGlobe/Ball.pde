public class Ball{
  String type;
  float health;
  int windCount;
  double speed;
  float xPos;
  float yPos;
    
  float size;
  color color_;
    
  boolean gravity;
    
  public Ball(){
    type = "Original";
    health = 1000;
    windCount = 1;
    speed = 5;
    
    size = 10;
    
    gravity = true;
    color_ = color(255, 255, 255);
    
  }
    
  public String getType(){
      return type;
  }
  
  public float getHealth(){
      return health;
  }
    
  public int getWindCount(){
      return windCount;
  }
  
  public float getX(){
      return xPos;
  }
  
  public float getY(){
      return yPos;
  }
    
    
  public void display(){
    noStroke();
    fill(color_, 255);
    ellipse(xPos, yPos, size * 2, size * 2);
  }
  
  // Selects coordinate from arraylist of arrays 
  // containing coordinates where the maze has 
  // been constructed.
  
  public void setStartPos(int x, int y){
    xPos = x;
    yPos = y;
  }
    
  public void move(float xDir, float yDir){
    if (xPos >= 580 || xPos <= 20) {
      xDir *= -1;
      yDir = 0;
    }
    if (yPos <= 20) {
      xDir = 0;
      yDir *= -1;
    }
    if (get((int)(xPos), (int)(yPos + 11)) != color(0)){
      if (gravity){
        xDir = 0;
        yDir = 0.25;
      } else {
        yDir += 0.125;
      }
    } else if (gravity) {
      yDir = 0;
    }
    if (yDir > 0.125){
      xDir = 0;
    }
    xPos += speed * xDir;
    yPos += speed * yDir;
  }
    
  public boolean touchingObs(Obstacle obs, int xObs, int yObs){
    return Math.abs(xObs - xPos) <= size && Math.abs(yObs - yPos) <= size;
  }
  
  public void changeHealth(float num){
    health += num;
  }
  
  public void setHealth(float num){
    health = 1000 - num;
  }
    
  public boolean touchingWind(Wind wind, int xWind, int yWind){
    if (xWind - xPos <= size * 2 || yWind - yPos <= size * 2){
      windCount++;
      return true;
    } else {
      return false;
    }
  }
  
  public void setGravity(boolean g){
    gravity = g;
  }
  
  public boolean getGravity(){
    return gravity;
  }
  
  public boolean withinPortal(){
    return (get((int)(xPos), (int)(yPos)) == color(204, 65, 37) || xPos > 570 && xPos < 600 && yPos > 550 && yPos < 600);
  }
}
  
// ----------------------------------------------------------------
  
//PImage image;

public class Droplet extends Ball{
  Droplet(){
    type = "Droplet";
    health = 1000;
    windCount = 1;
    speed = 5;
    size = 10;
    gravity = true;
    color_ = color(143, 165, 255);
  } 
    
    //public void display(){
      //image = loadImage("Droplet.png");
      //image(image, xPos, yPos);
      //image.resize((int)size, (int)size);
    //}
     
    public boolean touchingObs(Obstacle obs, int xObs, int yObs){
      if (xObs - xPos <= size * 2 || yObs - yPos <= size * 2){
        if (obs.getType().equals("Ice")){
          health -= 40;
        }
        return true;
      } else {
        return false;
      }
    }
  
  }
  
  public class Snitch extends Ball{
    
     Snitch(){
      //super();
      type = "Snitch";
      health = 1000;
    windCount = 1;
    speed = 5;
    
    size = 10;
    
    gravity = true;
      color_ = color(255, 231, 112);
    } 
    
    //public void display(){
      //super();
      //image = loadImage("Snitch.png");
      //image(image, xPos, yPos);
      //image.resize((int)size, (int)size);
    //}
     
    public boolean touchingObs(Obstacle obs, int xObs, int yObs){
      if (xObs - xPos <= size * 2 || yObs - yPos <= size * 2){
        if (obs.getType().equals("Gold")){
          health -= 40;
        }
        return true;
      } else {
        return false;
      }
    }
  
  }
  
  public class Stone extends Ball{
    
     Stone(){
      //super();
      type = "Stone";
      health = 1000;
    windCount = 1;
    speed = 5;
    
    size = 10;
    
    gravity = true;
      color_ = color(192, 178, 175);
    } 
     
    //public void display(){
      //super();
      //image = loadImage("Stone.png");
      //image(image, xPos, yPos);
      //image.resize((int)size, (int)size);
    //}
    
    public boolean touchingObs(Obstacle obs, int xObs, int yObs){
      if (xObs - xPos <= size * 2 || yObs - yPos <= size * 2){
        if (obs.getType().equals("Granite")){
          health -= 40;
        }
        return true;
      } else {
        return false;
      }
    }
  
  }
