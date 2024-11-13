import kareltherobot.*;

public class App implements Directions {
  public static void main(String[] args) {
    World.setVisible(true);
    World.setSize(10, 10);
    World.setDelay(100);

    Robot fred = new Robot(5, 1, East, 9);

    fred.move();
    fred.putBeeper();
    fred.move();
    fred.putBeeper();
    fred.move();
    fred.turnLeft();
    fred.move();
    fred.putBeeper();
  }
}