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
  var _inUnit;
  var _outUnit;
  var _inTemperature;
  var _outTemperatureAsString;

  Model() {
    _inUnit = temperatureUnit.degreesCelsius;
    _inTemperature = null;
    _outUnit = temperatureUnit.degreesFahrenheit;
    _outTemperatureAsString = "";
  }

  get inUnit => _inUnit;

  set inUnit(unit)=> _inUnit = unit;

  get outUnit => _outUnit;

  set outUnit(unit) => _outUnit = unit;

  get inTemperature => _inTemperature;

  set inTemperature(temp) => _inTemperature = temp;

  get outTemperatureAsString => _outTemperatureAsString;

  calculateOutTemperature() {
    if (inTemperature == null) {
      _outTemperatureAsString = "";
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
          _outTemperatureAsString =
              celsiusToString(kelvinToCelsius(outTemperatureInKelvin));
          break;
        case temperatureUnit.degreesFahrenheit:
          _outTemperatureAsString =
              fahrenheitToString(kelvinToFahrenheit(outTemperatureInKelvin));
          break;
        case temperatureUnit.kelvin:
          _outTemperatureAsString = kelvinToString(outTemperatureInKelvin);
          break;
        default:
          throw new ArgumentError("Unexpected output unit");
      }
    }
  }
}
