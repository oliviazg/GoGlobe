public class Ball{
  private String type;
  private float health;
  private int windCount;
  private double speed;
  private float xPos;
  private float yPos;
    
  private float size;
  private color color_;
    
  private boolean gravity;
    
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
  
  public float getHealth(){
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
    fill(color_, 255);
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
        yDir += 0.125;
      }
    } else if (gravity) {
      yDir = 0;
    }
    if (yDir > 0.125){
      xDir = 0;
    }
    xPos += speed * xDir;
    yPos += speed * yDir;
  }
    
  public boolean touchingObs(Obstacle obs, int xObs, int yObs){
    return Math.abs(xObs - xPos) <= size && Math.abs(yObs - yPos) <= size;
  }
  
  public void changeHealth(float num){
    health += num;
  }
  
  public void setHealth(float num){
    health = 1000 - num;
  }
    
  public boolean touchingWind(Wind wind, int xWind, int yWind){
    if (xWind - xPos <= size * 2 || yWind - yPos <= size * 2){
      windCount++;
      return true;
    } else {
      return false;
    }
  }
  
  public void setGravity(boolean g){
    gravity = g;
  }
  
  public boolean getGravity(){
    return gravity;
  }
  
  public boolean withinPortal(){
    return (get((int)(xPos), (int)(yPos)) == color(204, 65, 37));
  }
  
// ----------------------------------------------------------------
  
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
