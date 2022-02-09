public class Controller {
  ArrayList <Integer> directionQueue = new ArrayList<Integer>();
  Map <Integer, Integer> inverse = new HashMap<Integer, Integer>();
  
  public Controller() {
    inverse.put(38, 40);
    inverse.put(40, 38);
    inverse.put(39, 37);
    inverse.put(37, 39);
  }

  
  public void addDirection(int keycode) {
    directionQueue.add(keycode);
    checkQueue();
  }
  
  
  public void checkQueue() {
    if (directionQueue.isEmpty()) {
    } else {
       int top = pop();
       int opposite = inverse.get(snake.currentDirection);
       if (top != snake.currentDirection && top != opposite) {
         snake.setCurrentDirection(top);
       }
    }
  }
  
  
  public int pop() {
    int top = directionQueue.get(directionQueue.size() - 1);
    directionQueue.remove(directionQueue.size() - 1);
    return top;
  }
}
