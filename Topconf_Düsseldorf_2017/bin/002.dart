void main(List<String> args) {
  if (args.length < 1) {
    print("sorry, no args passed");
  } else {
    for (var arg in args) {
      print(arg);
    }
  }
}
