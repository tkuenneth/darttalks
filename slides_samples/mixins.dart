main() {
  var a = new A();
  a.sayHiThere();
  a.sayHello();
}

class A with Mix1, Mix2 {}

mixin Mix1 {
  sayHiThere() {
    print("Hi there");
  }
}

mixin Mix2 on Mix1 {
  sayHello() {
    sayHiThere();
    print("Hello");
  }
}
