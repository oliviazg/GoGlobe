static int endX = 500; //Portal will be centered at this x-coordinate.
static int endY = 500; //Portal will be centered at this y-coordinate.
static int difficulty; //the percentage of maze (impenetrable) compared to open space 
int numOfPixels;
int countdown;
int xDirection;
int yDirection;
ArrayList<int[]> mazeCoordinates = new ArrayList<int[]>();
Ball player;
int win;

//Generate the maze walls and ledges based on the given density. Total percentage of the maze area will equal the density.
void generateMaze(double difficulty) {
  int startY = (int) Math.random()*500; 
  int startX = (int) Math.random()*500;
  numOfPixels = (int) Math.random()*20; //pick a random number of pixels
  int randomHalf = (int) Math.random(); //flip a coin
  if (randomHalf%2 == 0) { //if heads
    xDirection = -1;
    yDirection = -1;
  } else { //if tails
    xDirection = 1;
    yDirection = 1;
    for (int i = 0; i < numOfPixels*difficulty; i++) { 
      if (xDirection == 1) {
        for (int x = startX; x < x + numOfPixels*difficulty; x++) {
          color c = color(0); //set pixel as black to indicate maze
          //set(c, x, startY);
          fill(c);
          rect(x, startY, 1, 1);
          int[] xyCoor = new int[2];
          xyCoor[0] = startX;
          xyCoor[1] = startY;
          mazeCoordinates.add(xyCoor);
        }
      }
      if (xDirection == -1) {
        for (int x2 = startX; x2 > x2 - numOfPixels*difficulty; x2--) {
          color c = color(0);
          fill(c);
          //set(c, x2, startY);
          rect(x2, startY, 1, 1);
          int[] xyCoor = new int[2];
          xyCoor[0] = startX;
          xyCoor[1] = startY;
          mazeCoordinates.add(xyCoor);
        }
      }
    startY = numOfPixels + yDirection * 40 * 2;
    if (startY > height || startY < 0) {
      numOfPixels = (int) Math.random()*30;
    }
  }
  }
}

//A portal will be created, centered at the given x- and y- coordinates. 
void makePortal(int endX, int endY) { 
  color c = color(0, 255, 0); 
  set(c, endX, endY); //set the pixel at coordinates endX and endY green
}

//Generate the maze walls and make the Portal by calling generateMaze(double difficulty) and makePortal(int x, int y)
void setup() {
  size(600, 800);
  player=new Ball();
  frameRate(60); //default frame; 60 frams will be displayed every second
  countdown = 100000;
  generateMaze(1);
}

void mousePressed(){
  if (countdown == 0) {
    countdown += 60;
  }
}

//Display the graphics 
void draw() {
  background(200);
  generateMaze(1);
  if(player.getX() == endX && player.getY() == endY){
    win=1;
    //key_log=new int[10];
  }
  if (win==1) { //if player is successful in the level
    //levels++; //progress to the next level
    difficulty++; //increase difficulty to generate a larger maze with more pixels
    //if (levels==level.length) { //once you've completed all the levels
    //  println("CONGRATS!"); //print congratulatory message
    //  println("You've completed all the levels!"); 
    //}
    //levels=levels%level.length; //
    //win=0;
  }
  if (countdown > 0){
    countdown--;
  }
  text("COUNTDOWN: ", 20, 20);
  text(countdown / 100, 110, 20);
  int time = 59;
  if (difficulty == 1) {
    println("Choose your avatar!");
  }
}

//movement of ball using arrow keys
void keyPressed() {
  if (key == '1') {
    player = new Ball();
  }
  if (key == '2') {
    player = new Ball();
  }
  if (key == '3') {
    player = new Ball();
  }
  if (key==' ') {
    player.changeGravity();
  }
  if (keyCode==LEFT) {
    player.xPos += 20;
  }
  if (keyCode==RIGHT) {
    player.xPos -= 20;
  }
  if (keyCode==UP) {
    if (player.changeGravity()){
      player.yPos += 20/9.81;
    }
  }
}
