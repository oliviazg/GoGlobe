public class Wind{
  
  private int speed;
  private int xPos;
  private int yPos;
  private float size;
  
  public Wind(){
    speed = 10;
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
    fill(255, 255, 255);
    textSize(size);
    text("W", xPos, yPos);
  }
  
  public boolean touchingBall(Ball ball, int xBall, int yBall){
    if (xBall - xPos <= size || yBall - yPos <= size){
      size = 0;
      return true;
    } else {
      return false;
    }
  }
  
}
