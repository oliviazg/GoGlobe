public class Maze {
  int endX; //Portal will be centered at this x-coordinate.
  int endY; //Portal will be centered at this y-coordinate.
  int startX = 50;
  int startY = 110;
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
            mazeCoordinates.add(x);
            mazeCoordinates.add(startY);
          }
        }
      }
      if (xDirection == -1) {
        for (int x2 = startX; x2 > (int) (Math.random()*450); x2--) {
          if (x2 > 50) {
            mazeCoordinates.add(x2);
            mazeCoordinates.add(startY);
          }
        }
      }
      startX = (int)(Math.random() * 500 + 50);
      startY += (int)(Math.random()*2+40);
      if (startY > 600) {
        i = numOfPixels * difficulty;
      }
    }
  }



void display() {
  int lastCoor = mazeCoordinates.size()-1;
  
  fill(204, 65, 37);
  rect(mazeCoordinates.get(lastCoor-1)-30, mazeCoordinates.get(lastCoor)-40, 30, 40);
  for (int i = 0; i < mazeCoordinates.size(); i+=2) {
      fill(0);
      rect(mazeCoordinates.get(i), mazeCoordinates.get(i+1), 100, 2);
    }
  } 
  int getCoor(int ind){
    if (ind < mazeCoordinates.size() && ind >= 0){
      return mazeCoordinates.get(ind);
    } else {
      return 0;
    }
  }


int coorSize(){
  return mazeCoordinates.size();
}
}
