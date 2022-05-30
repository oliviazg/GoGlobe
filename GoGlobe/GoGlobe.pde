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

//Generate the maze walls and make the Portal by calling generateMaze(double difficulty) and makePortal(int x, int y)
void setup() {
  size(600, 600);
  player=new Ball();
  frameRate(60); //default frame; 60 frams will be displayed every second
  countdown = 100000;
  maze = new Maze(1);
}

void mousePressed(){
  if (countdown == 0) {
    countdown += 60;
  }
}

//Display the graphics 
void draw() {
  background(200);
  maze.display();
  
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
