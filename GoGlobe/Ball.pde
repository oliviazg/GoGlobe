public class Ball{
  private int health;
  private int windCount;
  private double speed;
  private int xPos;
  private int yPOs;
  private int[] direction;
  private int[] up = {1, 0};
  private int[] down = {-1, 0};
  private int[] right = {0, 1};
  private int[] left = {0, -1};
    
  private double size;
  private color color_;
    
  private boolean gravity;
  private int setGravity = 0;
    
  public ball{
    health = 1000;
    windCount = 1;
    speed = 20;
    
    size = 40;
    color_ = 0;
    
    gravity = true;
    
  }
    
  public int getHealth(){
      return health;
  }
    
  public int getWindCount(){
      return windCount;
  }
    
    
  public void setStartPos(int x, int y){
      xPos = x;
      yPos = y;
  }
    
  public void move(){
      xPos += move(direction);
      yPos += move(direction);
  }
    
  public boolean die(){
      
  }
    
  public boolean touchingObs(){
      
  }
    
  public boolean addWind(){
      
  }
    
  public boolean changeGravity(){
      
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
  
  
  public class Original extends Ball{
    
    public Original{
      super();
    } 
     
    public boolean touchingObs(){
      
    }
  
  }
  
  public class Droplet extends Ball{
    
    public Original{
      super();
    } 
     
    public boolean touchingObs(){
      
    }
  
  }
  
  public class Snitch extends Ball{
    
    public Original{
      super();
    } 
     
    public boolean touchingObs(){
      
    }
  
  }
  
  public class Stone extends Ball{
    
    public Original{
      super();
    } 
     
    public boolean touchingObs(){
      
    }
  
  }
}
