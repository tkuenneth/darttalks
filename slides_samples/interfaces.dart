main() {
  var s = new Say();
  s.sayHello();
}

abstract class ISay {
  sayHello();
}

class Say implements ISay {
  sayHello() {
    print("Hello there!");
  }
}