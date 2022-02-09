public class Gm {
  Map <List<Integer>, String> entityMap = new HashMap<List<Integer>, String>();

  public void mapCoordinates() {
    for (List<Integer> coordinate : board.coordinates) {
      if (coordinate.get(0) == 0 || coordinate.get(0) == 380 || coordinate.get(1) == 0 || coordinate.get(1) == 380){
        entityMap.put(coordinate, "wall");
      } else {
        entityMap.put(coordinate, "empty");
      }
    }
  }
  
  public void updateMap(List<Integer> coordinate, String entity) {
    entityMap.put(coordinate, entity);
  }
}
