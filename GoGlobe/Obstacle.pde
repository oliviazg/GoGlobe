public class Obstacle{
  String type;
  String compareType;
  double speed;
  int xPos;
  int yPos;
  //float size;
  color color_;
  boolean orientation;
  float horizontal;
  float vertical;
    
  public Obstacle(){
    type = "Original";
    horizontal = 2;
    vertical = 2;
    color_ = color(255, 255, 255);
  }
  
  public String getType(){
      return type;
  }
  
  public String getCompareType(){
      return compareType;
  }
  
  public int getX(){
      return xPos;
  }
  
  public int getY(){
      return yPos;
  }
  
  
  // Selects coordinate from arraylist of arrays 
  // containing coordinates where the maze has 
  // been constructed.
  
  public void setPos(int x, int y){
    xPos = x;
    yPos = y;
  }
  
  public void display(){
    image(image, obs.getX() - 20, obs.getY());
  }
  
  public void move(){
    if ((millis() / 100) % 2 == 0){
      xPos += 1;
    } else {
      xPos -= 1;
    }
  }
}
  
  
  // ----------------------------------------------------------------

  
  PImage image;
  
  public class Ice extends Obstacle{
    
    public Ice(){
      type = "Ice";
      compareType = "Droplet";
      color_ = color(143, 165, 255);
    }
    
    public void display(){
    image(image, obs.getX() - 20, obs.getY());
  }
    
  }
  
  public class Gold extends Obstacle{
    
    public Gold(){
      type = "Gold";
      compareType = "Snitch";
      color_ = color(255, 231, 112);
    }
    
    public void display(){
    image(image, obs.getX() - 20, obs.getY());
  }
    
  }
  
  public class Granite extends Obstacle{
    
    public Granite(){
      type = "Granite";
      compareType = "Stone";
      color_ = color(192, 178, 175);
    }
    
    public void display(){
    image(image, obs.getX() - 20, obs.getY());
  }
  }
