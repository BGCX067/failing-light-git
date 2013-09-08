import 'lib/moon.dart';
import 'lib/stars.dart';

void main() {
  //TODO: Need to add support for checking if the browser supports
  //Support should probably be added via JS.
  Moon theMoon = new Moon();
  theMoon.ConstructingTheMoon();

  Stars theStars = new Stars();
  theStars.GenerateStars();
}