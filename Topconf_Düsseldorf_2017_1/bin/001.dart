/// a simple Dart program

// This is a toplevel function
main() {
  for (var i = 0; i <= 3; i++) {
    print(printer(i));
  }
}

// another toplevel function
printer(value) {
  return "$value x $value = ${calc(value)}";
}

// yet another toplevel function
calc(value) => value * value;
