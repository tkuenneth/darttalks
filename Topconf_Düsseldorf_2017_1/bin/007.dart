/// Identity vs. equality
main() {
  var a = "Hallo";
  var b = " Hallo".substring(1);

  print(a == b);
  // from dart:core
  print(identical(a, b));

  var c = a;
  print(identical(a, c));
}
