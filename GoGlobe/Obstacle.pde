public class Obstacle{
  private String type;
  private double speed;
  private int xPos;
  private int yPos;
  private double size;
  private color color_;
  private boolean orientation;
  int horizontal;
  int vertical;
    
  public Obstacle{
    horizontal = 2;
    vertical = 2;
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
  
  public void display(){
    noStroke();
    fill(color_, 100);
    if (orientation){
      vertical = size;
    }
    rect(xPos, yPos, horizontal, vertical);
  }
  
  public void move(){
    xPos += move * direction[horizontal - 2];
    yPos += move * direction[vertical - 2];
    xPos -= move * direction[horizontal - 2];
    yPos -= move * direction[vertical - 2];
  }
  
  public boolean touchingBall(Ball ball, int xBall, int yBall){
    if (xBall - xPos <= horizontal || yBall - yPos <= vertical){
      color_ = (255, 0, 0, 10);
      return true;
    } else {
      return false;
    }
  }
  
  
  // ----------------------------------------------------------------

  
  //public class Original extends Obstacle{
  //  private double color;
    
  //  public Original{
  //    super();
  //    color_ = (111, 168, 220);
  //  }
  //}
  PImage image;
    public Original(){
      super();
      color_ = (111, 168, 220);
    }
  }
  
  public class Ice extends Obstacle{
    private double color;
    
    public Ice(){
      super();
      type = "Ice";
      color_ = (201, 218, 248);
    }
    
    public display(){
      image = "Ice.png";
      image.resize(horizontal, vertical);
      image(image);
    }
    
  }
  
  public class Gold extends Obstacle{
    private double color;
    
    public Gold(){
      super();
      type = "Gold";
      color_ = (241, 194, 50);
    }
    
    public display(){
      image = "Gold.png";
      image.resize(horizontal, vertical);
      image(image);
    }
    
  }
  
  public class Granite extends Obstacle{
    private double color;
    
    public Granite(){
      super();
      type = "Granite";
      color_ = (204, 204, 204);
    }
    
    public display(){
      image = "Granite.png";
      image.resize(horizontal, vertical);
      image(image);
    }
    
}
