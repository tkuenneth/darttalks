/// This example demoes functions with named parameters

main() {
  print(function1(1, b: 2, c: 3));
  print(function1(1, c: 3));
  print(function1(1, b: 2));
}

function1(num a, {num b = 42, num c}) {
  print("a = $a");
  print("b = $b");
  print("c = $c");
  return a + b + c;
}
