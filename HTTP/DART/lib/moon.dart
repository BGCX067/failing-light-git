library moon;

import 'dart:html';
import 'dart:math';
import 'dart:async';

import 'direction.dart';

class Moon {
  final double increment = 0.01;

  Random random = new Random();
  double left;
  double top;
  double size;
  int direction;
  Element theMoon;

  Moon () {
    left = ((random.nextDouble() * 100) - 10);
    top = ((random.nextDouble() * 100) - 10);
    size = (random.nextDouble() * 11) + 10;
    direction = Direction.values.elementAt(random.nextInt(8));
    theMoon = document.getElementById("moon");
  }

  void ConstructingTheMoon () {
    size = double.parse(document.documentElement.getComputedStyle().width.replaceAll('px', '')) * (size/100);
    theMoon.style.width = size.toStringAsFixed(2) + "px";
    theMoon.style.height = size.toStringAsFixed(2) + "px";
    theMoon.style.top = top.toString() + "%";
    theMoon.style.left = left.toString() + "%";

    ShadingTheMoon();
    MovingTheMoon();
  }

  void ShadingTheMoon () {
    //TODO: Add in shading for the moon.
    return;
  }

  void MovingTheMoon () {
    if ((left * double.parse(document.documentElement.getComputedStyle().width.replaceAll('px', ''))) + size < 0) {
      left = 100.0;
    } else if (left > 100) {
      left = (0 - size)/double.parse(document.documentElement.getComputedStyle().width.replaceAll('px', ''));
    } else if (top > 100) {
      top = (0 - size)/double.parse(document.documentElement.getComputedStyle().height.replaceAll('px', ''));
    } else if ((top * double.parse(document.documentElement.getComputedStyle().height.replaceAll('px', ''))) + size < 0) {
      top = 100.0;
    }

    switch(direction) {
      case (Direction.NORTH):
        top = top - increment;
        break;
      case (Direction.NORTH_EAST):
        top = top - increment;
        left = left + increment;
        break;
      case (Direction.EAST):
        left = left + increment;
        break;
      case (Direction.SOUTH_EAST):
        top = top + increment;
        left = left + increment;
        break;
      case (Direction.SOUTH):
        top = top + increment;
        break;
      case (Direction.SOUTH_WEST):
        top = top + increment;
        left = left - increment;
        break;
      case (Direction.WEST):
        left = left - increment;
        break;
      case (Direction.NORTH_WEST):
        top = top - increment;
        left = left - increment;
        break;
    }

    theMoon.style.top = top.toString() + "%";
    theMoon.style.left = left.toString() + "%";

    new Timer(const Duration(milliseconds: 100), () {MovingTheMoon();});
  }
}