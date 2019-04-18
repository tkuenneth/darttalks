main() {
  var b = new B();
  b.sayHelloTo("Topconf");
  print(b.magic);
}

class A {
  sayHelloTo(name) {
    print("Hello, $name");
  }
}

class B extends Object with A {
  int magic = 123;
}
