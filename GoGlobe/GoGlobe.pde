static int endX = 500; //Portal will be centered at this x-coordinate.
static int endY = 500; //Portal will be centered at this y-coordinate.
static int difficulty; //the percentage of maze (impenetrable) compared to open space 
//int numOfPixels;
int countdown;
int countdownHelper;
//int xDirection;
//int yDirection;
//ArrayList<int[]> mazeCoordinates = new ArrayList<int[]>();
Ball player;
int win;
Maze maze;
float xDir;
float yDir;
ArrayList<Integer> mazeCoordinates = new ArrayList<Integer>();
Wind wind;

Obstacle obs1;
Obstacle obs2;
Obstacle obs3;

int coorX;
int coorY;
//Generate the maze walls and make the Portal by calling generateMaze(double difficulty) and makePortal(int x, int y)
void setup() {
  difficulty = 1;
  size(600, 600);
  maze = new Maze(difficulty);
  
  frameRate(60); //default frame; 60 frams will be displayed every second
  countdown = 10000;
  
  
  player = new Ball();
  player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
  
  wind = new Wind();
  wind.setPos(maze.getCoor(60)+1,maze.getCoor(61)-10);
  
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
  background(255, 242, 204);
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
  } else {
    player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
    wind.setPos(maze.getCoor(60)+1, maze.getCoor(61)-10);
    countdown = countdownHelper;
  }
  textSize(12);
  text("COUNTDOWN: ", 20, 20);
  text(countdown / 100, 110, 20);
  
  text("DIFFICULTY: ", 20, 35);
  text(difficulty, 100, 35);
  
  text("JUMP ABILITY: ", 20, 50);
  text(" "+!player.getGravity(), 100, 50);
  
  int time = 59;
  if (difficulty == 1) {
    println("Choose your avatar!");
  }
  
  player.display();
  player.move(xDir, yDir);
  xDir = 0;
  yDir = 0;
  if (player.getY() + 16 >= 600){
    player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
  }
  
  wind.display();
 
  obs1.display();
  obs2.display();
  obs3.display();
  obs1.move();
  obs2.move();
  obs3.move();
  
  player.touchingObs(obs1, obs1.getX(), obs1.getY());
  player.touchingObs(obs2, obs2.getX(), obs2.getY());
  player.touchingObs(obs3, obs3.getX(), obs3.getY());
  
  wind.touchingBall(player, (int) player.getX(), (int) player.getY());
  
  
  if (player.withinPortal()){
    //clear();
    difficulty++;
    maze = new Maze(difficulty);
    countdown = 10000 - 1000 * (difficulty - 1);
    countdownHelper = countdown;
    text(countdown / 100, 110, 20);
    text(difficulty, 100, 35);
    
    player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
    
    wind.setPos(maze.getCoor(60)+1, maze.getCoor(61)-10);
  
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
}

//movement of ball using arrow keys
void keyPressed() {
  if (key == '1') {
    player = new Ball();
  } else if (key == '2') {
    player = new Ball();
  } else if (key == '3') {
    player = new Ball();
  } else if (key==32) {
    player.changeGravity();
  } else if (keyCode==LEFT) {
    xDir = -2;
    yDir = 0;
  } else if (keyCode==RIGHT) {
    xDir = 2;
    yDir = 0;
  } else if (keyCode==UP) {
    if (!player.getGravity()){
      xDir = 0;
      yDir = -4;
    }
  } else {
    xDir = 0;
    yDir = 0;
  }
}
