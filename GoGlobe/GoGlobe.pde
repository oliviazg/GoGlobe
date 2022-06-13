//level
static int difficulty;  
//timer
//int sCountdown; //countdownHelper
int countdown;
int countdownHelper;
//screens
int screenMode = 0; //mode of screen (toggled between menuScreen and gameScreen with ENTER/RETURN key)
boolean paused; //pause feature (toggled with space key)
int menuScreen = 0; //intro screen with instructions at the beginning of the game
int gameScreen = 1; //normal gameScreen
//Player ball features
Ball player;
Obstacle obs;
Maze maze;
Wind wind;
int xCoor;
int yCoor;
float xDir;
float yDir;
//background RGB values
//start
float sR;
float sG;
float sB;
//end
float eR;
float eG;
float eB;
//List
ArrayList<Obstacle> obsList = new ArrayList<Obstacle>(); //list of obstacles
ArrayList<Integer> mazeCoordinates = new ArrayList<Integer>(); //list of mazeCoordinates/pixels

//Generate the maze walls and make the Portal by calling generateMaze(double difficulty) and makePortal(int x, int y)
void setup() {
  difficulty = 1; //set level to 1
  size(600, 600);
  screenMode = 0; //display menuScreen initially
  paused = false; //set the game mode to "not paused" initially
  
  
  fill(0); //black pixels
  maze = new Maze(difficulty); //create the new maze based on the difficulty level
  
  frameRate(60); //default frame; 200 frames will be displayed every second
  
  countdownHelper = 1000; //set initial timer
  countdown = countdownHelper;
  //initial player is Droplet
  player = new Droplet(); 
  player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
  
  //add obstacles randomly
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
  
  //add Wind powerup 
  wind = new Wind();
  wind.setPos(maze.getCoor(60)+1,maze.getCoor(61)-10);
  
  //set the obstacles at a random point
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
  
  //values for RGB (background)
  sR = 78;
  sG = 22;
  sB = 91;
  
  eR = 255;
  eG = 148;
  eB = 71;
}
//draw the menuScreen
void drawMenu() {
  //gray screen with black text
  fill(220,220,220, 80);
  rect(10,10, 580, 580);
  fill(0);
  
  //instructions to be displayed
  text("Welcome to GoGlobe! Please press your ENTER/RETURN key to begin the game.", 40, 50);
  textSize(15);
  text("INSTRUCTIONS: ", 40, 80);
  textSize(12);
  text("Navigate the ball to the portal before the timer runs out using your UP, LEFT, RIGHT ", 40, 110);
  text("arrow keys! You can only use the UP arrow key is Jump Ability is on. ", 40, 125);
  text("The Jump Ability mode can be toggled on and off using the G key.", 40, 140);
  text("Health will decrement when Jump Ability is on. ", 40, 155);
  text("Collect wind powerups to increase speed. The timer will get shorter as the level increases.", 40, 170);
  text("Avoid the bottom border (ground kills the ball). ", 40, 200);
  text("Avoid certain obstacles:", 40, 215);
  text("ice obstacles deal more damage to Droplet ball", 40, 230);
  text("gold obstacles deal more damage to Golden Snitch ball", 40, 245);
  text("granite obstacles deal more damage to Stone ball", 40, 260);
  text("Your ball dies and the level is reset when:", 40, 275);
  text("1.) your health reaches 0", 40, 290);
  text("2.) the timer runs out ", 40, 305);
  text("3.) if you hit the ground.", 40, 320);
  text("To switch between balls:", 40, 350);
  text("Press 1 to switch your ball to Droplet avatar", 40, 365);
  text("Press 2 to switch your ball to Golden Snitch avatar", 40, 380);
  text("Press 3 to switch your ball to Stone avatar", 40, 395);
  text("Press SPACE to pause or unpause the game.", 40, 425);
  text("Press your ENTER/RETURN key to return to instructions in the game!", 40, 440);
}
//Display the graphics 
void draw() {
  //determine whether to display menuMode or gameMode
  if (screenMode == menuScreen) {
    drawMenu();
  } else {
    //if pause feature is NOT activated (so normal game mode)...
    if (!paused) {
      
      //background colors
    background(sR + (countdownHelper - countdown) * (eR - sR) / countdownHelper, 
  sG + (countdownHelper - countdown) * (eG - sG) / countdownHelper, 
  sB - (countdownHelper - countdown) * (sB - eB) / countdownHelper);
  
  //borders
  fill(0);
  rect(0, 0, 5, 600);
  rect(0, 0, 600, 5);
  rect(0, 595, 600, 5);
  rect(595, 0, 5, 600);
  maze.display();
  
  //counter
   if (countdown > 0){ //decrement counter
    //countdownHelper--;
    //countdown = countdownHelper;
    countdown--;
  } else { //if counter hits zero
    player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10); //reset the player Ball
    wind.windReceived = false;
    player.speed = 5;
    player.windCount = 0;
    wind.setPos(maze.getCoor(60)+1, maze.getCoor(61)-10); //reset the Wind powerup
    
    //countdown = countdownHelper; 
  }
  //display
  fill(255);
  textSize(12);
  //countdown display
  text("COUNTDOWN: ", 20, 20);
  text(countdown / 10, 110, 20);
  //level display
  text("LEVEL: ", 20, 35);
  text(difficulty, 60, 35);
  //jump ability display, to be toggled with g key
  text("JUMP ABILITY: ", 20, 50);
  text(" " + !player.getGravity(), 100, 50);
  //health display
  text("HEALTH: ", 20, 65);
  text(" " + player.getHealth(), 70, 65);
  //wind count display
  text("WIND COUNT: ", 20, 80);
  text(" "+player.windCount, 100, 80);
  
  //level display
  text("LEVEL: ", 20, 35);
  text(difficulty, 60, 35);
  
  //jump ability display, to be toggled with g key
  text("JUMP ABILITY: ", 20, 50);
  text(" " + !player.getGravity(), 100, 50);
  
  //health display
  text("HEALTH: ", 20, 65);
  text(" " + player.getHealth(), 70, 65);
  
  //wind count display
  text("WIND COUNT: ", 20, 80);
  text(" "+player.windCount, 100, 80);

  //display character and move

  image = loadImage("" + player.getType() + ".png");


  float xSize = player.getSize();
  if (player.getType().equals("Snitch")){
    xSize += 20;
  }

  image.resize((int)xSize, (int)player.getSize());
  player.display();
  player.move(xDir, yDir);
  xDir = 0;
  yDir = 0;
  
  //animate obstacles
  for (int i = 0; i < obsList.size() - 1; i++){
    obs = obsList.get(i);    
    image = loadImage("" + obs.getType() + ".png");
    image.resize(40, 10);
    obs.display();
    obs.move();
  }
  
  //display wind Powerup
  wind.display();
  
  //if player is touching the obstacle, more damage is dealt depending on player Type
  if (player.touchingObs(obs, obs.getX(), obs.getY())){
    //println("WORKS but not original for some reason");
    if (player.getType().equals(obs.getCompareType())){
      //println("WORKS");
      player.changeHealth(-4); 
    } else {
      player.changeHealth(-1);
    }
  }
  
  //println("ballPos: "+player.getX(), player.getY());
  //println("windPos: "+wind.getX(), wind.getY());
  if (wind.touchingBall(player, (int) player.getX(), (int) player.getY())){
    //println("WORKS");
    if (!wind.windReceived) {
      //println("works but wind received is true for some reason");
        wind.windReceived = true; 
        player.windCount++;
        player.speed = 10;
      }
  }
  
  //if jump ability is true, decrement health
  if (!player.getGravity()){
    player.changeHealth(-0.25);
  } 
  
  //if player hits the borders or if health hits zero or if timer runs out, the player dies
  if (player.getY() + 16 >= 600 || player.getHealth() <= 0 || countdown == 0){
    die(player);
  }
  
  //if player hits the portal, level up
  if (player.withinPortal()){
    levelUp();
  }
  }
  }
}
  
// move to next level
void levelUp (){    
  if (player.withinPortal()){
    difficulty++;
    maze = new Maze(difficulty);
    countdownHelper = 600 - 40 * (difficulty - 1);
    if (countdownHelper <= 20) {
      countdownHelper = 20;
    }
    countdown = countdownHelper;
    text(countdown / 10, 110, 20);
    text(difficulty, 100, 35);
    
    player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
    
    wind.setPos(maze.getCoor(60)+1, maze.getCoor(61)-10);
    wind.windReceived = false;
    player.speed = 5;
    player.windCount = 0;
    wind.display();
    
    if (wind.touchingBall(player, (int) player.getX(), (int) player.getY())){
    if (!wind.windReceived) {
        wind.windReceived = true; 
        player.windCount++;
        player.speed = 10;
      }
  }
  
  player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
  player.setGravity(true);  
    
  player.setHealth((difficulty - 1)*10);
  
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
//ball dies
void die(Ball ball){
  player.setStartPos(maze.getCoor(0) + 1, maze.getCoor(1) - 10);
  wind.windReceived = false;
  player.speed = 5;
  wind.setPos(maze.getCoor(60)+1, maze.getCoor(61)-10);
  player.windCount = 0;
   wind.display();
  player.setHealth((difficulty - 1)*10);
  player.setGravity(true);
  countdownHelper = 600 - 40 * (difficulty - 1);
  if (countdownHelper <= 20) {
      countdownHelper = 20;
    }
  countdown = countdownHelper;
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
    fill(220,220,220, 80);
    rect(10,10, 580, 580);
    fill(255,0,0);
    textSize(50);
    text("GAME PAUSED", 150, 300);
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
  } else if (keyCode == ENTER || keyCode == RETURN) {
    if (screenMode == menuScreen) {
      screenMode = gameScreen;
    } else {
      screenMode = menuScreen;
    }
  }
  else if (keyCode=='G' || keyCode == 'g') {
    if (player.gravity) {
      player.gravity = false;
    } else {
      player.gravity = true;
    }
  } else {
    xDir = 0;
    yDir = 0;
  }
}
