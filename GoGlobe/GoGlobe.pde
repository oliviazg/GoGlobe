static int endX = 500; //Portal will be centered at this x-coordinate.
static int endY = 500; //Portal will be centered at this y-coordinate.
static int difficulty; //the percentage of maze (impenetrable) compared to open space 
int sCountdown;
int countdown;
Ball player;
ArrayList<Obstacle> obsList = new ArrayList<Obstacle>();
Obstacle obs;
int win;
Maze maze;
float xDir;
float yDir;
ArrayList<Integer> mazeCoordinates = new ArrayList<Integer>();

int xCoor;
int yCoor;

float sR;
float sG;
float sB;
  
float eR;
float eG;
float eB;

//Generate the maze walls and make the Portal by calling generateMaze(double difficulty) and makePortal(int x, int y)
void setup() {
  difficulty = 1;
  size(600, 600);
  maze = new Maze(difficulty);
  
  frameRate(60); //default frame; 60 frames will be displayed every second
  sCountdown = 4000;
  countdown = sCountdown;
  
  
  player = new Ball();
  player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
  
  for (int i = 0; i <= difficulty; i++){
    obsList.add(new Obstacle());
  }
  
  int ind = (int)(Math.random() * (maze.coorSize() - 1) + 40);
  for (int i = 0; i <= obsList.size() - 1; i++){
    obs = obsList.get(i);
    if (ind % 2 == 0){
      xCoor = maze.getCoor(ind);
      yCoor = maze.getCoor(ind + 1) - 10;
    } else {
      xCoor = maze.getCoor(ind - 1);
      yCoor = maze.getCoor(ind) - 10;
    }
    obs.setPos(xCoor, yCoor);
    
    int ind1 = (int)(Math.random() * (maze.coorSize() - 1) + 40);
    while(Math.abs(ind1 - ind) < 20){
      ind1 = (int)(Math.random() * (maze.coorSize() - 1) + 40);
    }
    
    ind = ind1;
  }
  
  sR = 78;
  sG = 22;
  sB = 91;
  
  eR = 255;
  eG = 148;
  eB = 71;
}

//Display the graphics 
void draw() {
  
  background(sR + (sCountdown - countdown) * (eR - sR) / sCountdown, 
  sG + (sCountdown - countdown) * (eG - sG) / sCountdown, 
  sB - (sCountdown - countdown) * (sB - eB) / sCountdown);

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
  }
  if (win==1) { //if player is successful in the level
    difficulty++; //increase difficulty to generate a larger maze with more pixels
  }
  if (countdown > 0){
    countdown--;
  }
  text("COUNTDOWN: ", 20, 20);
  text(countdown / 100, 110, 20);
  
  text("DIFFICULTY: ", 20, 35);
  text(difficulty, 100, 35);
  
  text("JUMP ABILITY: ", 20, 50);
  text(" " + !player.getGravity(), 100, 50);
  
  text("HEALTH: ", 20, 65);
  text(" " + player.getHealth(), 70, 65);
  
  int time = 59;
  if (difficulty == 1) {
    println("Choose your avatar!");
  }
  
  player.display();
  player.move(xDir, yDir);
  xDir = 0;
  yDir = 0;
  
  for (int i = 0; i < obsList.size() - 1; i++){
    obs = obsList.get(i);
    obs.display();
    obs.move();
  }
  
  if (player.touchingObs(obs, obs.getX(), obs.getY())){
    player.changeHealth(-2);
  }
  
  if (!player.getGravity()){
    player.changeHealth(-0.25);
  }
  
  if (player.getY() + 16 >= 600 || player.getHealth() == 0 || countdown == 0){
    die(player);
  }
  
  if (player.withinPortal()){
    levelUp();
  }
}

// move to next level
void levelUp (){    
  
  player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
  player.setGravity(true);
  
  maze = new Maze(difficulty);
  
  difficulty++;
  sCountdown = 4000 - 500 * (difficulty - 1);
  countdown = sCountdown;
    
  player.setHealth((difficulty - 1) * 100);
  
  obsList = new ArrayList<Obstacle>();
    
  for (int i = 0; i <= difficulty; i++){
    obsList.add(new Obstacle());
  }
  
  for (int i = 0; i <= obsList.size() - 1; i++){
    obs = obsList.get(i);
    int ind = (int)(Math.random() * (maze.coorSize() - 1) + 40);
    if (ind % 2 == 0){
      xCoor = maze.getCoor(ind);
      yCoor = maze.getCoor(ind + 1) - 10;
    } else {
      xCoor = maze.getCoor(ind - 1);
      yCoor = maze.getCoor(ind) - 10;
    }
    obs.setPos(xCoor, yCoor);
  }
  
}

void die(Ball ball){
  player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
  player.setHealth(0);
  player.setGravity(true);
  sCountdown = 4000 - 500 * (difficulty - 1);
  countdown = sCountdown;
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
    player.setGravity(!player.getGravity());
  } else if (keyCode==LEFT) {
    xDir = -2;
    yDir = 0;
  } else if (keyCode==RIGHT) {
    xDir = 2;
    yDir = 0;
  } else if (keyCode==UP) {
    if (!player.getGravity()){
      xDir = 0;
      yDir = -2;
    }
  } else {
    xDir = 0;
    yDir = 0;
  }
}
