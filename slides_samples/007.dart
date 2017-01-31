main() {
  var a = new C();
  a.b = 42;
  a.b = 24;
  print("${a.a}, ${a.b}");
}

class C {
  var _b;
  
  get a => 123;
  
  get b => _b;
  set b(val) => _b = 321;
}
