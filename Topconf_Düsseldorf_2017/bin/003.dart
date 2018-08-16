/// This example shows how to use libraries

import "dart:math";

void main(List<String> args) {
  var i = pow(2, 53);
  print(i);
  print(i + 1);
  i *= -1;
  print(i);
  print(i - 1);
}

/// Dart integers are mathematical integers, so in theory
/// thry have no maximum value; to to transpilation to JavaScript
/// Dart inherits the limits of JavaScript (numbers are IEEE 754
/// floating point)
