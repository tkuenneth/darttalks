// Copyright (c) 2017, Thomas Kuenneth.
// All rights reserved. Use of this source code is governed by the
// GNU General Public license version 3 that can be found in the LICENSE file.

library model;

import 'converter.dart';

enum temperatureUnit { degreesCelsius, degreesFahrenheit, kelvin }

temperatureUnit enumFor(String str) {
  for (var v in temperatureUnit.values) {
    if (v.toString().endsWith(str)) {
      return v;
    }
  }
  return null;
}

class Model {
  var inUnit;
  var outUnit;
  var inTemperature;
  var outTemperature;
  var outTemperatureAsString;

  Model() {
    inUnit = temperatureUnit.degreesCelsius;
    inTemperature = null;
    outUnit = temperatureUnit.degreesFahrenheit;
    outTemperatureAsString = "";
  }

  calculateOutTemperature() {
    if (inTemperature == null) {
      outTemperatureAsString = "";
    } else {
      double outTemperatureInKelvin;
      switch (inUnit) {
        case temperatureUnit.degreesCelsius:
          outTemperatureInKelvin = celsiusToKelvin(inTemperature);
          break;
        case temperatureUnit.degreesFahrenheit:
          outTemperatureInKelvin = fahrenheitToKelvin(inTemperature);
          break;
        case temperatureUnit.kelvin:
          outTemperatureInKelvin = inTemperature;
          break;
        default:
          throw new ArgumentError("Unexpected input unit");
      }
      switch (outUnit) {
        case temperatureUnit.degreesCelsius:
          outTemperatureAsString =
              celsiusToString(kelvinToCelsius(outTemperatureInKelvin));
          break;
        case temperatureUnit.degreesFahrenheit:
          outTemperatureAsString =
              fahrenheitToString(kelvinToFahrenheit(outTemperatureInKelvin));
          break;
        case temperatureUnit.kelvin:
          outTemperatureAsString = kelvinToString(outTemperatureInKelvin);
          break;
        default:
          throw new ArgumentError("Unexpected output unit");
      }
    }
  }
}
