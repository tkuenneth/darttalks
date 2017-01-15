// Copyright (c) 2017, Thomas Kuenneth.
// All rights reserved. Use of this source code is governed by the
// GNU General Public license version 3 that can be found in the LICENSE file.

import 'package:temperatureconverter/src/converter.dart';

main(List<String> args) {
  for (var arg in args) {
    var d = stringToDouble(arg);
    print("${celsiusToString(d)} = ${fahrenheitToString(celsiusToFahrenheit(d))}");
    print("${celsiusToString(d)} = ${kelvinToString(celsiusToKelvin(d))}");

    print("${fahrenheitToString(d)} = ${celsiusToString(fahrenheitToCelsius(d))}");
    print("${fahrenheitToString(d)} = ${kelvinToString(fahrenheitToKelvin(d))}");

    print("${kelvinToString(d)} = ${celsiusToString(kelvinToCelsius(d))}");
    print("${kelvinToString(d)} = ${fahrenheitToString(kelvinToFahrenheit(d))}");
  }
}
