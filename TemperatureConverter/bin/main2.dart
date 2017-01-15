// Copyright (c) 2017, Thomas Kuenneth.
// All rights reserved. Use of this source code is governed by the
// GNU General Public license version 3 that can be found in the LICENSE file.

import 'package:temperatureconverter/src/converter.dart';
import 'package:temperatureconverter/src/model.dart';

main(List<String> args) {
  if (args.length != 3) {
    print(
        "Usage: main2 degreesCelsius|degreesFahrenheit|kelvin value degreesCelsius|degreesFahrenheit|kelvin");
  } else {
    Model model = new Model();
    model.inUnit = enumFor(args[0]);
    model.inTemperature = stringToDouble(args[1]);
    model.outUnit = enumFor(args[2]);
    model.calculateOutTemperature();
    print("${args[1]} ${args[0]} is ${model.outTemperatureAsString}");
  }
}
