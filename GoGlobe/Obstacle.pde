public class Obstacle{
  private double speed;
  private int xPos;
  private int yPos;
  private double size;
  private color color_;
  private boolean orientation;
  
  public Obstacle{
    
  }
  
  public color getColor(){
    return color_;
  }
  
  
  // Selects coordinate from arraylist of arrays 
  // containing coordinates where the maze has 
  // been constructed.
  
  //public void setPos(int x, int y){
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
  
  public boolean touchingBall(){
    if (xBall - xPos <= horizontal || yBall - yPos <= vertical){
      color_ = (255, 0, 0, 10);
      return true;
    } else {
      return false;
    }
  }
  
  
  //public class Original extends Obstacle{
  //  private double color;
    
  //  public Original{
  //    super();
  //  }
  //}
  
  //public class Ice extends Obstacle{
  //  private double color;
    
  //  public Original{
  //    super();
  //  }
  //}
  
  //public class Gold extends Obstacle{
  //  private double color;
    
  //  public Original{
  //    super();
  //  }
  //}
  
  //public class Granite extends Obstacle{
  //  private double color;
    
  //  public Original{
  //    super();
  //  }
  //}
}
