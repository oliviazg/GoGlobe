public class Maze {
  int endX = 500; //Portal will be centered at this x-coordinate.
  int endY = 500; //Portal will be centered at this y-coordinate.
  int startX = 50;
  int startY = 100;
  int numOfPixels;
  int xDirection;
  ArrayList<Integer> mazeCoordinates = new ArrayList<Integer>();
  color c;
  
  
  //Generate the maze walls and ledges based on the given density. Total percentage of the maze area will equal the density.
  public Maze(int difficulty) {
   numOfPixels = (int) (Math.random()*1500000+1400000); //pick a random number of pixels
    for (int i = 0; i < numOfPixels * difficulty; i++) { 
      int randomHalf = (int) (Math.random()*2); //flip a coin
      if (randomHalf%2 == 0) { //if heads
        xDirection = -1;
      } else { //if tails
        xDirection = 1;
      }
      if (xDirection == 1) {
        for (int x = startX; x < (int)(Math.random() * 500 + startX); x++) {
          if (x < 550) {
            //c = color(0); //set pixel as black to indicate maze
            //set(c, x, startY);
            mazeCoordinates.add(x);
            mazeCoordinates.add(startY);
          }
        }
      }
      if (xDirection == -1) {
        for (int x2 = startX; x2 > (int) (Math.random()*600); x2--) {
          if (x2 > 50) {
            //c = color(0);
            //set(c, x2, startY);
            mazeCoordinates.add(x2);
            mazeCoordinates.add(startY);
          }
        }
      }
      startX += xDirection*300;
      startY += (int)(Math.random()*2+10);
      if (startY > 600) {
        i = numOfPixels*difficulty;
      }
    }
  }

//A portal will be created, centered at the given x- and y- coordinates. 
void makePortal(int endX, int endY) { 
  color c = color(0, 255, 0); 
  mazeCoordinates.add(-1 * endX);
  mazeCoordinates.add(-1 * endY);
  //set(c, endX, endY); //set the pixel at coordinates endX and endY green
}

void display() {
  
  for (int i = 0; i < mazeCoordinates.size(); i+=2) {
    if (mazeCoordinates.get(i) < 0) {
      fill(0, 255, 0);
      rect(-1 * mazeCoordinates.get(i), -1 * mazeCoordinates.get(i+1), 100, 5);
    } else {
      fill(0);
      rect(mazeCoordinates.get(i), mazeCoordinates.get(i + 1), 100, 5);
    }
  }
}
int getCoor(int pos){
  if (pos < mazeCoordinates.size() && pos >= 0){
    return mazeCoordinates.get(pos);
  } else {
    return 0;
  }
}

int coorSize(){
  return mazeCoordinates.size();
}
  
}
