public class Ball{
  private int health;
  private int windCount;
  private double speed;
  private int xPos;
  private int yPos;
  private int[] direction;
  private int[] up = {1, 0};
  private int[] down = {-1, 0};
  private int[] right = {0, 1};
  private int[] left = {0, -1};
    
  private double size;
  private color color_;
    
  private boolean gravity;
  private int setGravity = 0;
    
  public Ball(){
    health = 1000;
    windCount = 1;
    speed = 20;
    
    size = 40;
    
    gravity = true;
    
  }
    
  public int getHealth(){
      return health;
  }
    
  public int getWindCount(){
      return windCount;
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
    
    
  public void display(){
    noStroke();
    fill(color_, 100);
    rectangle(xPos, yPos, size * 2, size * 2);
  }
  
  // Selects coordinate from arraylist of arrays 
  // containing coordinates where the maze has 
  // been constructed.
  
  //public void setStartPos(int x, int y){
  //  xPos = x;
  //  yPos = y;
  //}
    
  public void move(){
    xPos += move * direction[1];
    yPos += move * direction[0];
  }
    
  public boolean die(){
    if (health == 0 || millis() - 100000000 == 0){
      color_ = 0;
      size = 0;
    }
  }
    
  public boolean touchingObs(Obstacle obs, int xObs, int yObs){
    if (xObs - xPos <= size * 2 || yObs - yPos <= size * 2){
      health -= 20;
      return true;
    } else {
      return false;
    }
  }
    
  public boolean touchingWind(Wind wind, int xWind, int yWind){
    if (xWind - xPos <= size * 2 || yWind - yPos <= size * 2){
      windCount++;
      return true;
    } else {
      return false;
    }
  }
    
  public boolean changeGravity(){
    gravity = (setGravity % 2 == 0);
  }
    
  public void keyPressed(){
      if (keyPressed == 24){
        direction = up;
      }
      if (keyPressed == 25){
        direction = down;
      }
      if (keyPressed == 26){
        direction = left;
      }
      if (keyPressed == 27){
        direction = right;
      }
      
      if (keyPressed == 255){
        setGravity++;
      }
  }
  
// ----------------------------------------------------------------
  
  public class Original extends Ball{
    
    public Original{
      super();
      color_ = (111, 168, 220);
    } 
     
    public void display(){
      super();
    }
  
    public boolean touchingObs(Obstacle obs, int xObs, int yObs){
       super();
    }
  
  }
  
  public class Droplet extends Ball{
    
    public Droplet{
      super();
      color_ = (201, 218, 248);
    } 
    
    public void display(){
      super();
      // add glare
    }
     
    public boolean touchingObs(Obstacle obs, int xObs, int yObs){
      if (xObs - xPos <= size * 2 || yObs - yPos <= size * 2){
        if (obs.getColor() != (201, 218, 248)){
          health -= 40;
        }
        return true;
      } else {
        return false;
      }
    }
  
  }
  
  public class Snitch extends Ball{
    
    public Snitch{
      super();
      color_ = (241, 194, 50);
    } 
    
    public void display(){
      super();
      // add shine
    }
     
    public boolean touchingObs(Obstacle obs, int xObs, int yObs){
      if (xObs - xPos <= size * 2 || yObs - yPos <= size * 2){
        if (obs.getColor() != (241, 194, 50)){
          health -= 40;
        }
        return true;
      } else {
        return false;
      }
    }
  
  }
  
  public class Stone extends Ball{
    
    public Stone{
      super();
      color_ = (204, 204, 204);
    } 
     
    public void display(){
      super();
      // add ridges
    }
    
    public boolean touchingObs(Obstacle obs, int xObs, int yObs){
      if (xObs - xPos <= size * 2 || yObs - yPos <= size * 2){
        if (obs.getColor() != (204, 204, 204)){
          health -= 40;
        }
        return true;
      } else {
        return false;
      }
    }
  
  }
}
