class Point {
  const int x;
  const int y;

  Point(this.x, this.y);

  @override
  String toString() {
    return "($x, $y)";
  }
}

main() {
  Point p1 = Point(5, 5);
  Point p2 = Point(10, 10);

  print(p1.toString() + " and " + p2.toString());
}