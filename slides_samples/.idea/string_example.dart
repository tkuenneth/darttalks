main() {
  String s = "123";
  for (int i = 0; i < s.length; i++) {
    print("${s[i]}, ${s.codeUnitAt(i)}");
  }

  s = "\u{1f600}";
  print("${s}, ${s.length}");
  for (int i = 0; i < s.length; i++) {
    print(s.codeUnitAt(i));
  }

  print(s.runes.length);
  s.runes.forEach(print);
}
