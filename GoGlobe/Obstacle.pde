public class Obstacle{
  private double speed;
  private int xPos;
  private int yPos;
  private double size;
  private color color_;
  private boolean orientation;
  

  public Obstacle(){
    size = 40;
  }
  
  public color getColor(){
    return color_;
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
  
  //public void setPos(int x, int y){
    //xPos = x;
    //yPos = y;
  //}
  
  public void display(){
    noStroke();
    fill(color_, 100);
    int horizontal = 2;
    int vertical = 2;
    if (orientation){
      vertical = size;
    }
    ellipse(xPos, yPos, horizontal, vertical);
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

  
  public class Original extends Obstacle{
    private double color;
    
    public Original(){
      super();
      color_ = (111, 168, 220);
    }
  }
  
  public class Ice extends Obstacle{
    private double color;
    
    public Ice(){
      super();
      color_ = (201, 218, 248);
    }
    
    public display(){
      // add glare
    }
    
  }
  
  public class Gold extends Obstacle{
    private double color;
    
    public Gold(){
      super();
      color_ = (241, 194, 50);
    }
    
    public display(){
      // add shine
    }
    
  }
  
  public class Granite extends Obstacle{
    private double color;
    
    public Granite(){
      super();
      color_ = (204, 204, 204);
    }
    
    public display(){
      // add ridges
    }
    
  }
}
