static int endX = 500; //Portal will be centered at this x-coordinate.
static int endY = 500; //Portal will be centered at this y-coordinate.
static int difficulty; //the percentage of maze (impenetrable) compared to open space 
//int numOfPixels;
int countdown;
//int xDirection;
//int yDirection;
//ArrayList<int[]> mazeCoordinates = new ArrayList<int[]>();
Ball player;
int win;
Maze maze;
int xDir;
int yDir;
ArrayList<Integer> mazeCoordinates = new ArrayList<Integer>();

Obstacle obs1;
Obstacle obs2;
Obstacle obs3;

int coorX;
int coorY;
//Generate the maze walls and make the Portal by calling generateMaze(double difficulty) and makePortal(int x, int y)
void setup() {
  size(600, 600);
  maze = new Maze(1);
  
  frameRate(60); //default frame; 60 frams will be displayed every second
  countdown = 100000;
  
  
  player = new Ball();
  player.setStartPos(maze.getCoor(0), maze.getCoor(1) + 20);
  
  coorX = maze.getCoor((int)(Math.random() * maze.coorSize() + 40));
  coorY = maze.getCoor(coorX + 1);
  obs1 = new Obstacle();
  obs1.setPos(coorX, coorY);
  
  coorX = maze.getCoor((int)(Math.random() * maze.coorSize() + 40));
  coorY = maze.getCoor(coorX + 1);
  obs2 = new Obstacle();
  
  coorX = maze.getCoor((int)(Math.random() * maze.coorSize() + 40));
  coorY = maze.getCoor(coorX + 1);
  obs3 = new Obstacle();
}

//Display the graphics 
void draw() {
  background(200);
  fill(0);
  rect(0, 0, 5, 600);
  rect(0, 0, 600, 5);
  rect(0, 595, 600, 5);
  rect(595, 0, 5, 600);
  maze.display();
  fill(0);
  rect(0, 0, 5, 600);
  rect(0, 0, 600, 5);
  rect(0, 595, 600, 5);
  rect(595, 0, 5, 600);
  
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
  
  player.display();
  player.move(xDir, yDir);
  xDir = 0;
  yDir = 0;
  
  obs1.display();
  obs2.display();
  obs3.display();
  
  player.touchingObs(obs1, obs1.getX(), obs1.getY());
  player.touchingObs(obs2, obs2.getX(), obs2.getY());
  player.touchingObs(obs3, obs3.getX(), obs3.getY());
}

//movement of ball using arrow keys
void keyPressed() {
  if (key == '1') {
    player = new Ball();
  } else if (key == '2') {
    player = new Ball();
  } else if (key == '3') {
    player = new Ball();
  } else if (key==' ') {
    player.changeGravity();
  } else if (keyCode==LEFT) {
    xDir = -5;
    yDir = 0;
  } else if (keyCode==RIGHT) {
    xDir = 5;
    yDir = 0;
  } else if (keyCode==UP) {
    if (!player.changeGravity()){
      xDir = 0;
      yDir = (int)(5/9.81);
    }
  } else {
    xDir = 0;
    yDir = 0;
  }
}
