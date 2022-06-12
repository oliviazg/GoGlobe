static int endX = 500; //Portal will be centered at this x-coordinate.
static int endY = 500; //Portal will be centered at this y-coordinate.
static int difficulty; //the percentage of maze (impenetrable) compared to open space 
int sCountdown;
int countdown;
boolean paused;

int countdownHelper;

Ball player;
ArrayList<Obstacle> obsList = new ArrayList<Obstacle>();
Obstacle obs;
int win;
Maze maze;
float xDir;
float yDir;
ArrayList<Integer> mazeCoordinates = new ArrayList<Integer>();
Wind wind;

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
  paused = false;
  

  frameRate(60); //default frame; 60 frames will be displayed every second
  sCountdown = 4000;
  countdown = sCountdown;

  
  player = new Droplet();
  player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
  
  for (int i = 0; i <= difficulty; i++){
    int obsType = (int)(Math.random() * 3);
    if (obsType % 3 == 0){
      obsList.add(new Ice());
    } else if (obsType % 2 == 0){
      obsList.add(new Gold());
    } else {
      obsList.add(new Granite());
    }
  }

  wind = new Wind();
  wind.setPos(maze.getCoor(60)+1,maze.getCoor(61)-10);
  
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
  if (!paused) {
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
  } else {
    //if counter hits zero
    player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
    wind.setPos(maze.getCoor(60)+1, maze.getCoor(61)-10);
    countdown = countdownHelper;
  }
  fill(255);
  textSize(12);
  text("COUNTDOWN: ", 20, 20);
  text(countdown / 100, 110, 20);
  
  text("DIFFICULTY: ", 20, 35);
  text(difficulty, 100, 35);
  
  //text("JUMP ABILITY: ", 20, 50);
  //text(" " + !player.getGravity(), 100, 50);
  
  text("HEALTH: ", 20, 50);
  text(" " + player.getHealth(), 70, 50);
  
  text("WIND COUNT: ", 20, 65);
  text(" "+player.windCount, 100, 65);
  
  int time = 59;
  if (difficulty == 1) {
    println("Choose your avatar!");
  }
  
  image = loadImage(player.display());
  image.resize((int)size, (int)size);
  image(image, player.getX() - 10, player.getY() - 10);
  
  player.move(xDir, yDir);
  xDir = 0;
  yDir = 0;
  
  for (int i = 0; i < obsList.size() - 1; i++){
    obs = obsList.get(i);
    obs.display();
    obs.move();
  }
  
  wind.display();
  
  if (player.touchingObs(obs, obs.getX(), obs.getY())){
    if (player.getType().equals("Original")){
      player.changeHealth(-2);
    } else {
      player.changeHealth(-4);
    }
  }
  
  if (!player.getGravity()){
    player.changeHealth(-0.25);
  }
  
  if (player.getY() + 16 >= 600 || player.getHealth() <= 0 || countdown == 0){
    die(player);
  }
  
  if (player.withinPortal()){
    levelUp();
  }
  }
}

// move to next level
void levelUp (){    
  wind.display();
  
  /**
  if (wind.touchingBall(player, (int) player.getX(), (int) player.getY())) {
    player.speed += 10;
    color background = color(255, 242, 204);
    set(background, wind.getX(), wind.getY());
  }**/
  
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
  
  player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
  player.setGravity(true);
  
  maze = new Maze(difficulty);
  
  difficulty++;
  sCountdown = 4000 - 500 * (difficulty - 1);
  countdown = sCountdown;
    
  player.setHealth((difficulty - 1) * 100);
  
  obsList = new ArrayList<Obstacle>();
    
  for (int i = 0; i <= difficulty; i++){
    int obsType = (int)(Math.random() * 3);
    if (obsType % 3 == 0){
      obsList.add(new Ice());
    } else if (obsType % 2 == 0){
      obsList.add(new Gold());
    } else {
      obsList.add(new Granite());
    }
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
}

void die(Ball ball){
  player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
  wind.setPos(maze.getCoor(0)+1, maze.getCoor(1)-10);
  player.setHealth(0);
  player.setGravity(true);
  sCountdown = 4000 - 500 * (difficulty - 1);
  countdown = sCountdown;
}

//movement of ball using arrow keys
void keyPressed() {
  if (key == '1') {
    player = new Droplet();
    player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
  } else if (key == '2') {
    player = new Snitch();
    player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
  } else if (key == '3') {
    player = new Stone();
    player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
  } else if (key==32) {
    if (paused) {
      paused = false;
    } else {
      paused = true;
    }
    textSize(50);
    text("GAME PAUSED", 150, 300);
  } else if (keyCode==LEFT) {
    xDir = -2;
    yDir = 0;
  } else if (keyCode==RIGHT) {
    xDir = 2;
    yDir = 0;
  } else if (keyCode==UP) {
    //if (!player.getGravity()){
      xDir = 0;
      yDir = -2;
    //}
  } else {
    xDir = 0;
    yDir = 0;
  }
}
