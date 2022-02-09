import java.util .*;

public class Snake {
  int currentDirection, previousDirection;
  ArrayList<List<Integer>> positions = new ArrayList<List<Integer>>() {{
    add(Arrays.asList(80, 200)); // head
    add(Arrays.asList(60, 200)); // body
    add(Arrays.asList(40, 200)); // tail
  }};
  Map <List<Integer>, Integer> directionMap = new HashMap<List<Integer>, Integer>();
  ArrayList<Integer> directions = new ArrayList<Integer>();
  int snakeLength = positions.size();
  PImage headImgUp, headImgRight , headImgDown,  headImgLeft, bodyImg, tailImgUp, tailImgRight, tailImgDown, tailImgLeft;
  
  public Snake() {
    currentDirection = 39;
    headImgUp = loadImage("images/head_up.png");
    headImgUp.resize(20, 20);
    headImgRight = loadImage("images/head_right.png");
    headImgRight.resize(20, 20);
    headImgDown = loadImage("images/head_down.png");
    headImgDown.resize(20, 20);
    headImgLeft = loadImage("images/head_left.png");
    headImgLeft.resize(20, 20);
    tailImgUp = loadImage("images/tail_up.png");
    tailImgUp.resize(20, 20);
    tailImgRight = loadImage("images/tail_right.png");
    tailImgRight.resize(20, 20);
    tailImgDown = loadImage("images/tail_down.png");
    tailImgDown.resize(20, 20);
    tailImgLeft = loadImage("images/tail_left.png");
    tailImgLeft.resize(20, 20);
    bodyImg = loadImage("images/snake_body.png");
    bodyImg.resize(20, 20);
    //setUpDirectionMap();
    for (int i=0; i<positions.size(); i++) {
      //directionMap.put(coordinates, 39);
      directions.add(39);
    }
  }
  
  public int getSnakeLength() {
    return snakeLength;
  }
  
  public ArrayList<List<Integer>> getPositions() {
    return positions;
  }
  
  public void incrementSnakeLength(){
    snakeLength ++;
  }
  
  //public void setUpDirectionMap() {
  //  for (List<Integer> coordinates : positions) {
  //    directionMap.put(coordinates, 0);
  //  }
  //}
  
  public void setCurrentDirection(int direction) {
    currentDirection = direction;
    directionMap.put(positions.get(0), direction);
  }
  
  public int getCurrentDirection() {
    return currentDirection;
  }
  
  public void updateEntityMap () {
    for (int i = 0; i < positions.size(); i++) {
       gridmanager.updateMap(positions.get(i), "snake");
    }
  }
  
  public void move() {
    int x, y;
    x = positions.get(0).get(0);
    y = positions.get(0).get(1);
    Collections.rotate(positions, 1);
    positions.get(0).set(0, x);
    positions.get(0).set(1, y);
    switch (currentDirection) {
      case 40: // down
        y += 20;
        positions.get(0).set(1, y);
        break;
      case 39: //right
        x += 20;
        positions.get(0).set(0, x);
        break;
      case 38: //up
        y -= 20;
        positions.get(0).set(1, y);
        break;
      case 37: //left
        x -= 20;
        positions.get(0).set(0, x);
        break;
    }
    directions.set(0, currentDirection);
    shiftDirection();
  }
  
  public void shiftDirection () {
    //int previousDirection;
    //for (int i=1; i<positions.size();i++) {
    //  previousDirection = directionMap.get(positions.get(i-1));
    //  directionMap.put(positions.get(i), previousDirection);
    //  }
    Collections.rotate(directions, 1);
    }
  
  public void appendPosition() {
    int x, y;
    x = positions.get(positions.size()-1).get(0) - 20;
    y = positions.get(positions.size()-1).get(1);
    ArrayList<List<Integer>> coords = new ArrayList<List<Integer>>() {{
      add(Arrays.asList(x, y));
    }};
    positions.add(coords.get(0));
    directions.add(directions.get(directions.size()-1));
  }
  
  public void eatApple() {
   int x, y, apple_x, apple_y;
   x = positions.get(0).get(0);
   y = positions.get(0).get(1);
   apple_x = apple.coordinate.get(0).get(0);
   apple_y = apple.coordinate.get(0).get(1);
   if (x == apple_x && y == apple_y) {
     apple.appleCounter ++;
     snakeLength ++;
     snake.appendPosition();
     apple.replaceApple();
   }
  }
  
  public void renderSnake() {
    int tailIndex = positions.size() - 1;
    for (List<Integer> coordinates : positions) {
      int index = positions.indexOf(coordinates);
      if (index == 0) {
        switch (currentDirection) {
          case 40: // down
            image(headImgDown, coordinates.get(0), coordinates.get(1));
            break;
          case 39: //right
            image(headImgRight, coordinates.get(0), coordinates.get(1));
            break;
          case 38: //up
            image(headImgUp, coordinates.get(0), coordinates.get(1));
            break;
          case 37: //left
            image(headImgLeft, coordinates.get(0), coordinates.get(1));
            break;
        }
      } else if (index == tailIndex) {
        //int bufferDirection = directionMap.get(positions.get(tailIndex));
        switch (directions.get(tailIndex)) {
          case 40: // down
            image(tailImgDown, coordinates.get(0), coordinates.get(1));
            break;
          case 39: //right
            image(tailImgRight, coordinates.get(0), coordinates.get(1));
            break;
          case 38: //up
            image(tailImgUp, coordinates.get(0), coordinates.get(1));
            break;
          case 37: //left
            image(tailImgLeft, coordinates.get(0), coordinates.get(1));
            break;
        }
      } else {
        image(bodyImg, coordinates.get(0), coordinates.get(1));
      }
    }
  }
}
