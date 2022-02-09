int SNAKESPEED;
int noKeyPressedPerFrame;
boolean gameOver, start;
PImage appleCounterImg;
Apple apple;
Snake snake;
Controller controller;
Board board;
Gm gridmanager;

void setup() {
  size(400, 400);
  frameRate(60);
  gameOver = false;
  start = false;
  noKeyPressedPerFrame = 0;
  SNAKESPEED = 5;
  snake = new Snake();
  controller = new Controller();
  board = new Board();
  gridmanager = new Gm();
  gridmanager.mapCoordinates();
  snake.updateEntityMap();
  apple = new Apple();
  apple.placeApple();
  board.mapImages();
  appleCounterImg = loadImage("images/apple.png");
  appleCounterImg.resize(20, 20);
}

void draw() {
  if (start == true) {
    if(gameOver != true) {
      if (frameCount % SNAKESPEED == 0) {
        board.renderBoard();
        image(appleCounterImg, 0, 0);
        textSize(20);
        String counterString = "" + apple.appleCounter;
        text(counterString, 25, 17);
        fill(#000000);
        snake.move();
        snake.eatApple();
        snake.renderSnake();
        apple.renderApple();
        
        if (snake.positions.get(0).get(0) == 0 || snake.positions.get(0).get(0) == 380 || snake.positions.get(0).get(1) == 0 || snake.positions.get(0).get(1) == 380) {
          gameOver= true;
        } 
       
       for (int i=1; i<snake.positions.size(); i++) {
         if (snake.positions.get(0).get(0) == snake.positions.get(i).get(0) && snake.positions.get(0).get(1) == snake.positions.get(i).get(1)) {
           gameOver = true;
         }
       }
      } 
      if (frameCount % 5 == 0) {
         noKeyPressedPerFrame = 0;
      }
    } else {
        textSize(75);
        text("Game Over", 25, 220);
        fill(#000000);
      }
    }
  }  

void keyPressed() {
  if(key == CODED) {
    start = true;
    if (noKeyPressedPerFrame <= 2) {
      noKeyPressedPerFrame += 1;
      controller.addDirection(keyCode);
    }
  }
}
