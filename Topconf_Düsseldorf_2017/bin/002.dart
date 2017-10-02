main() {
  for (int i = 1; i <= 3; i++) {
    if (i < 2) {
      continue;
    }

    print("Hello Dart $i");
  }
}
