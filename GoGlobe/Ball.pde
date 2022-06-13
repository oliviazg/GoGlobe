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
    health = 100;
    windCount = 0;
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
  
  public float getSize(){
      return size;
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
        yDir += 0.5;
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
    health = 100 - num;
  }

    /**
  public boolean touchingWind(Wind wind, int xWind, int yWind){
    if (xWind - xPos <= size * 2 || yWind - yPos <= size * 2){
      windCount++;
      return true;
    } else {
      return false;
    }
  }**/

  
  public void setGravity(boolean g){
    gravity = g;
  }
  
  public boolean getGravity(){
    return gravity;
  }
  
  public boolean withinPortal(){

    return (get((int)(xPos), (int)(yPos)) == color(204, 65, 37));
  }

  public String display(){
      if (millis() % 2 == 0){
        return "Droplet 1.png";
      } else {
       return "Droplet 2.png";
      }
     
}
}
  
// ----------------------------------------------------------------
  
//PImage image;

public class Droplet extends Ball{
  Droplet(){
    type = "Droplet";
    health = 100;
    windCount = 0;
    speed = 5;
    size = 20;
    gravity = true;
    color_ = color(143, 165, 255);
  } 
    
    public String display(){
      if (millis() % 2 == 0){
        return "Droplet 1.png";
      } else {
       return "Droplet 2.png";
      }
      
    }
     
    public boolean touchingObs(Obstacle obs, int xObs, int yObs){
      if (xObs - xPos <= size * 2 && yObs - yPos <= size * 2){
        if (!obs.getType().equals("Ice")){
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }
}
  
  
  public class Snitch extends Ball{
    
     Snitch(){
      type = "Snitch";
      health = 100;
    windCount = 0;
    speed = 5;
    
    size = 20;
    
    gravity = true;
      color_ = color(255, 231, 112);
    } 
    
    public String display(){
      if (millis() % 2 == 0){
        return "Snitch 1.png";
      } else {
         return "Snitch 2.png";
      }
    }
     
    public boolean touchingObs(Obstacle obs, int xObs, int yObs){
      if (xObs - xPos <= size * 2 && yObs - yPos <= size * 2){
        if (!obs.getType().equals("Gold")){
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }
  
  }
  
  public class Stone extends Ball{
    
    Stone(){
      type = "Stone";
      health = 100;
    windCount = 0;
    speed = 5;
    
    size = 20;
    
    gravity = true;
      color_ = color(192, 178, 175);
    } 
     
    public String display(){
      if (millis() % 2 == 0){
        return "Stone 1.png";
      } else {
       return "Stone 2.png";
      }
      
    }
    
    public boolean touchingObs(Obstacle obs, int xObs, int yObs){
      if (xObs - xPos <= size * 2 && yObs - yPos <= size * 2){
        if (!obs.getType().equals("Granite")){
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
  
  }
}
