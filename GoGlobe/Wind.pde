public class Wind{
  
  private int speed;
  private int xPos;
  private int yPos;
  private double size;
  
  public Wind{
    speed = 10;
  }
  
  public display(){
    fill(255, 255, 255);
    textSize(size);
    text("W", xPos, yPos);
  }
  
  public boolean touchingBall(Ball ball, int xBall, int yBall){
    if (xBall - xPos <= horizontal || yBall - yPos <= vertical){
      size = 0;
      return true;
    } else {
      return false;
    }
  }
  
}
