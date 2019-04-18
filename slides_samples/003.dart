main() {
  var a = 10;
  print(a + 0.5);
  print(a);
  print(a.runtimeType);
  final double b = .1;
  print(b);
  print(b.runtimeType);
  dynamic c = 10;
  print(c.runtimeType);
  c = "Hallo";
  print(c.runtimeType);
}
