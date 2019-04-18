main() {
  var a = new Object();
  print(a.runtimeType);

  var b = 1;
  print(b.runtimeType);
  print(b.runtimeType == int);
  print(b.runtimeType == Object);
  print(b is Object);
}
