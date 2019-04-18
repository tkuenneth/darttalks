main() {
  var a = new C();
  a.a = 42;
  a.b = 24;
  print("${a.a}, ${a.b}");
}

class C {
  var _b;

  get a => 123;
  set a(wert) => {};

  get b => _b;
  set b(val) => _b = 321;
}
