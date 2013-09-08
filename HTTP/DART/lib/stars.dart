library stars;

import 'dart:math';
import 'dart:html';
import 'dart:async';

class Stars {
  int numberStars;
  Random randomGen;

  Stars () {
    randomGen = new Random();
    numberStars = randomGen.nextInt(101) + 100;

    GenerateStars();
  }

  void GenerateStars () {
    for (int i = 0; i < numberStars; i++) {
      Element star = new Element.div();
      star.$dom_setAttribute('id', 'star-' + i.toString());
      star.$dom_setAttribute('class', 'star');
      SetStarSize(star);
      SetStarLocation(star);
      document.getElementById('stars').append(star);
    }

    TwinkleStars();
  }

  void SetStarSize (Element star) {
    double size = (randomGen.nextDouble() * 4) + 1;
    star.style.width = size.toStringAsFixed(2) + "px";
    star.style.height = size.toStringAsFixed(2) + "px";
  }

  void SetStarLocation (Element star) {
    double left = (randomGen.nextDouble() * 100);
    double top = (randomGen.nextDouble() * 100);
    star.style.left = left.toStringAsFixed(2) + "%";
    star.style.top = top.toStringAsFixed(2) + "%";
  }

  void TwinkleStars () {
    Element star = document.getElementById("star-" + randomGen.nextInt(numberStars).toString());
    if (star != null) {
      star.$dom_setAttribute('class', 'star twinkle');
      new Timer(const Duration(milliseconds: 500), () {RemoveTwinkle(star);});
    }

    new Timer(const Duration(milliseconds: 250), () {TwinkleStars();});
  }

  void RemoveTwinkle(Element star) {
    if (star != null) {
      star.$dom_setAttribute('class', 'star');
    }
  }
}