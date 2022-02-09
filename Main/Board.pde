public class Board {
  int noCols = 20;
  int noRows = 20;
  ArrayList<List<Integer>> coordinates = new ArrayList<List<Integer>>();
  Map<List<Integer>, PImage> hash_map = new HashMap<List<Integer>, PImage>();
  PImage brickImg, groundImg;
  
  public Board() {
    createCoordinates();
    brickImg = loadImage("images/brick.png");
    brickImg.resize(20, 20);
    groundImg = loadImage("images/ground.png");
    groundImg.resize(20, 20);
  }
  
  public void createCoordinates() {
    int xVar = 0;
    int yVar = 0;
    for (int row = 0; row < noRows; row++) {
      for (int col = 0; col < noCols; col++) {
        coordinates.add(Arrays.asList(xVar, yVar));
        xVar += 20;
      }
      xVar = 0;
      yVar += 20;
    }
  }
  
  public void mapImages() {
    for (List<Integer> coordinate : coordinates) {
      if (coordinate.get(0) == 0 || coordinate.get(0) == 380 || coordinate.get(1) == 0 || coordinate.get(1) == 380){
        hash_map.put(coordinate, brickImg);
      } else {
        hash_map.put(coordinate, groundImg);
      }
    }
  }
  
  public void renderBoard() {
    for (Map.Entry<List<Integer>, PImage> entry : hash_map.entrySet()) {
      List<Integer> key = entry.getKey();
      PImage value = entry.getValue();
      image(value, key.get(0), key.get(1));
    } 
  }
}
