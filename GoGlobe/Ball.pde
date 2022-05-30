public class Ball{
  private String type;
  private int health;
  private int windCount;
  private double speed;
  private float xPos;
  private float yPos;
  //private int[] direction;
  //private int[] up = {1, 0};
  //private int[] down = {-1, 0};
  //private int[] right = {0, 1};
  //private int[] left = {0, -1};
    
  private float size;
  private color color_;
    
  private boolean gravity;
  //private int setGravity = 0;
    
  public Ball(){
    type = "Original";
    health = 1000;
    windCount = 1;
    speed = 5;
    
    size = 10;
    
    gravity = true;
    color_ = color(11,83,148);
    
  }
    
  public String getType(){
      return type;
  }
  
  public int getHealth(){
      return health;
  }
    
  public int getWindCount(){
      return windCount;
  }
  
  public float getX(){
      return xPos;
  }
  
  public float getY(){
      return yPos;
  }
    
    
  public void display(){
    noStroke();
    fill(color_, 100);
    ellipse(xPos, yPos, size * 2, size * 2);
  }
  
  // Selects coordinate from arraylist of arrays 
  // containing coordinates where the maze has 
  // been constructed.
  
  public void setStartPos(int x, int y){
    xPos = x;
    yPos = y;
  }
    
  public void move(float xDir, float yDir){
    if (xPos >= 600 || xPos <= 0) {
      xDir *= -5;
      yDir = 0;
    }
    if (yPos <= 0) {
      xDir = 0;
      yDir *= -5;
    }
    if (get((int)(xPos), (int)(yPos + 11)) != color(0)){
      if (gravity){
        xDir = 0;
        yDir = 0.25;
      } else {
        yDir += 0.25;
      }
    } else if (gravity) {
      yDir = 0;
    }
    xPos += speed * xDir;
    yPos += speed * yDir;
  }
    
  //public void die(){
  //}
    
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
    
  public void changeGravity(){
    gravity = !gravity;
  }
  
  public boolean getGravity(){
    return gravity;
  }
  
  public boolean withinPortal(){
    return (get((int)(xPos), (int)(yPos)) == color(0,128,0));
  }
    
  //public void keyPressed(){
  //    if (keyPressed == 24){
  //      direction = up;
  //    }
  //    if (keyPressed == 25){
  //      direction = down;
  //    }
  //    if (keyPressed == 26){
  //      direction = left;
  //    }
  //    if (keyPressed == 27){
  //      direction = right;
  //    }
      
  //    if (keyPressed == 255){
  //      setGravity++;
  //    }
  //}
  
// ----------------------------------------------------------------
  

  //public class Original extends Ball{
    
  //  public Original{
  //    super();
  //    color_ = color(111, 168, 220);
  //  } 
     
  //  public void display(){
  //    super();
  //  }
  
  //  public boolean touchingObs(Obstacle obs, int xObs, int yObs){
  //     super();
  //  }
  
  PImage image;
    
  public class Droplet extends Ball{
    
    public Droplet(){
      super();
      type = "Droplet";
      //color_ = color(201, 218, 248);
    } 
    
    public void display(){
      //super();
      image = loadImage("Droplet.png");
      image(image, xPos, yPos);
      image.resize((int)size, (int)size);
    }
     
    public boolean touchingObs(Obstacle obs, int xObs, int yObs){
      if (xObs - xPos <= size * 2 || yObs - yPos <= size * 2){
        if (obs.getType().equals("Ice")){
          health -= 40;
        }
        return true;
      } else {
        return false;
      }
    }
  
  }
  
  public class Snitch extends Ball{
    
    public Snitch(){
      super();
      type = "Snitch";
      //color_ = color(241, 194, 50);
    } 
    
    public void display(){
      //super();
      image = loadImage("Snitch.png");
      image(image, xPos, yPos);
      image.resize((int)size, (int)size);
    }
     
    public boolean touchingObs(Obstacle obs, int xObs, int yObs){
      if (xObs - xPos <= size * 2 || yObs - yPos <= size * 2){
        if (obs.getType().equals("Gold")){
          health -= 40;
        }
        return true;
      } else {
        return false;
      }
    }
  
  }
  
  public class Stone extends Ball{
    
    public Stone(){
      super();
      type = "Stone";
      //color_ = color(204, 204, 204);
    } 
     
    public void display(){
      //super();
      image = loadImage("Stone.png");
      image(image, xPos, yPos);
      image.resize((int)size, (int)size);
    }
    
    public boolean touchingObs(Obstacle obs, int xObs, int yObs){
      if (xObs - xPos <= size * 2 || yObs - yPos <= size * 2){
        if (obs.getType().equals("Granite")){
          health -= 40;
        }
        return true;
      } else {
        return false;
      }
    }
  
  }
}
