main() {
  var a = new Object();
  print(a.runtimeType);
  var b = 1;
  print(b.runtimeType);
  dynamic c;
  print(c.runtimeType);
  print(null.runtimeType);
  print(true.runtimeType);
  print(123.45.runtimeType);
}

/// Everything in Dart is an object
/// During runtime everything is the instance of a class
/// All classes are derived from Object
