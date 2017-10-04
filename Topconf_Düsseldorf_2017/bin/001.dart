main() {
  for (var i = 0; i <= 3; i++) {
    print(printer(i));
  }
}

printer(value) {
  return "$value x $value = ${calc(value)}";
}

calc(value) => value * value;
