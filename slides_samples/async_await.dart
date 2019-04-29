main() async {
  print("Say hello");
  await sayHello();
  print("Finished");
}

sayHello() async {
  return Future.delayed(Duration(seconds: 3), () {
    print("Hello");
  });
}
