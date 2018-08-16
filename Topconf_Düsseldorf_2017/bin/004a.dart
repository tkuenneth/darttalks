main() {
  // functions can be assigned to variables
  var f1 = (x) => x * x;
  print(f1(4));
  // and they can be anonymous
  var l = [1, 2, 3];
  l.forEach((val) {
    print("$val * $val = ${val * val}");
  });
}
