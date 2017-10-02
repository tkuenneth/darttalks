main() {
  var a = 2;
  print("$a, ${square(a)}");
  print("$a, ${reciprocal(a)}");
}

square(x) => x * x;

reciprocal(x) {
  return 1 / x;
}
