public class Obstacle{
  String type;
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
  
  public String display(){
    return "Ice.png";
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
      color_ = color(143, 165, 255);
    }
    
    public String display(){
    return "Ice.png";
  }
    
  }
  
  public class Gold extends Obstacle{
    
    public Gold(){
      type = "Gold";
      color_ = color(255, 231, 112);
    }
    
    public String display(){
    return "Gold.png";
  }
    
  }
  
  public class Granite extends Obstacle{
    
    public Granite(){
      type = "Granite";
      color_ = color(192, 178, 175);
    }
    
    public String display(){
    return "Granite.png";
  }
  }
