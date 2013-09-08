library direction;

class Direction {
  static const NORTH = const Direction._(0);
  static const NORTH_EAST = const Direction._(1);
  static const EAST = const Direction._(2);
  static const SOUTH_EAST = const Direction._(3);
  static const SOUTH = const Direction._(4);
  static const SOUTH_WEST = const Direction._(5);
  static const WEST = const Direction._(6);
  static const NORTH_WEST = const Direction._(7);

  static get values => [NORTH, NORTH_EAST, EAST, SOUTH_EAST, SOUTH, SOUTH_WEST, WEST, NORTH_WEST];

  final int value;

  const Direction._(this.value);
}