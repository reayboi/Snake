public class Apple {
  PImage appleImg;
  ArrayList<List<Integer>> coordinate = new ArrayList<List<Integer>>();
  int appleCounter = 0;
 
  public Apple() {
    appleImg = loadImage("images/apple.png");
    appleImg.resize(20, 20);
  }
  
  public void renderApple() {
    image(appleImg, coordinate.get(0).get(0), coordinate.get(0).get(1));
  }
  
  public void replaceApple() {
    ArrayList<List<Integer>> previous_coordinate = new ArrayList<List<Integer>>();
    previous_coordinate.add(coordinate.get(0));
    coordinate.clear();
    placeApple();
    gridmanager.updateMap(previous_coordinate.get(0), "empty");
    previous_coordinate.clear();
  }
  
  public void placeApple() {
    ArrayList<List<Integer>> potentialCoordinates = new ArrayList<List<Integer>>();
    for (Map.Entry<List<Integer>, String> cell : gridmanager.entityMap.entrySet()) {
      List<Integer> key = cell.getKey();
      String value = cell.getValue();
      if (value == "empty") {
        potentialCoordinates.add(key);
      }
    } 
    
    coordinate.add(potentialCoordinates.get(new Random().nextInt(potentialCoordinates.size())));
    gridmanager.updateMap(coordinate.get(0), "apple");
  }
}
