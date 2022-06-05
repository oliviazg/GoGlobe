public class Obstacle{
  private String type;
  private double speed;
  private int xPos;
  private int yPos;
  private float size;
  private color color_;
  private boolean orientation;
  private float horizontal;
  private float vertical;
    
  public Obstacle(){
    type = "Original";
    horizontal = 2;
    vertical = 2;
    color_ = color(255, 255, 255);
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
    fill(color_, 255);
    if (orientation){
      vertical = size;
    }
    rect(xPos, yPos, 20, 10);
  }
  
  public void move(){
    if ((millis() / 100) % 2 == 0){
      xPos += 1;
    } else {
      xPos -= 1;
    }
  }
  
  public boolean touchingBall(Ball ball, int xBall, int yBall){
    if (xBall - xPos <= horizontal || yBall - yPos <= vertical){
      color_ = color(255, 0, 0, 10);
      return true;
    } else {
      return false;
    }
  }
  
  
  // ----------------------------------------------------------------

  
  PImage image;
  
  public class Ice extends Obstacle{
    
    public Ice(){
      super();
      type = "Ice";
      color_ = color(143, 165, 255);
    }
    
    //public void display(){
    //  //super();
    //  image = loadImage("Ice.png");
    //  image.resize((int)horizontal, (int)vertical);
    //  image(image, xPos, yPos);
    //}
    
  }
  
  public class Gold extends Obstacle{
    
    public Gold(){
      super();
      type = "Gold";
      color_ = color(255, 231, 112);
    }
    
    //public void display(){
    //  //super();
    //  image = loadImage("Gold.png");
    //  image.resize((int)horizontal, (int)vertical);
    //  image(image, xPos, yPos);
    //}
    
  }
  
  public class Granite extends Obstacle{
    
    public Granite(){
      super();
      type = "Granite";
      color_ = color(192, 178, 175);
    }
    
    //public void display(){
    //  //super();
    //  image = loadImage("Granite.png");
    //  image.resize((int)horizontal, (int)vertical);
    //  image(image, xPos, yPos);
    //}
    
}
}
