// Copyright (c) 2017, Thomas Kuenneth.
// All rights reserved. Use of this source code is governed by the
// GNU General Public license version 3 that can be found in the LICENSE file.

library converter;

import 'package:intl/intl.dart';

const String DEGREES_CELSIUS = "\u00B0C";
const String DEGREES_FAHRENHEIT = "\u00B0F";
const String KELVIN = "K";

final NumberFormat _f = new NumberFormat.decimalPattern("de_DE");

double stringToDouble(String s) => _f.parse(s);

double celsiusToKelvin(double celsius) => 273.15 + celsius;

double fahrenheitToKelvin(double fahrenheit) => (fahrenheit + 459.67) * 5 / 9;

double kelvinToCelsius(double kelvin) => kelvin - 273.15;

double kelvinToFahrenheit(double kelvin) => kelvin * 1.8 - 459.67;

double celsiusToFahrenheit(double celsius) => (celsius * 1.8) + 32;

double fahrenheitToCelsius(double fahrenheit) => (fahrenheit - 32) * 5 / 9;

String celsiusToString(double celsius) => doubleToString(celsius, DEGREES_CELSIUS);

String fahrenheitToString(double fahrenheit) => doubleToString(fahrenheit, DEGREES_FAHRENHEIT);

String kelvinToString(double kelvin) => doubleToString(kelvin, KELVIN);

String doubleToString(double val, String suffix) {
  var rounded = val.round();
  // Could be implemented nicer using intl
  return "${_f.format(val == rounded ? rounded : val)} $suffix";
}
