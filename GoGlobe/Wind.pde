public class Wind{
  
  private int speed;
  private int xPos;
  private int yPos;
  private float size;
  private boolean windReceived;
  
  public Wind(){
    speed = 10;
    size = 15;
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
    fill(255,0,0);
    textSize(size);
    if (!touchingBall(player, (int)player.getX(), (int)player.getY()) && !windReceived){
      text("W", xPos, yPos);
    }
  }
  
  public boolean touchingBall(Ball ball, int xBall, int yBall){
    return xBall == xPos && yBall == yPos;
  }
  
}
